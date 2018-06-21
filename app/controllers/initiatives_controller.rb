# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  def index
    states = %i[draft confirmating rejected locked]
    @q = Initiative.includes(:categories, :attachments).ransack(params[:q])
    @initiatives = @q.result.available_everyone(states).page(params[:page]).per(6)
    add_breadcrumb t('views.pages.global.initiatives'), :initiatives_path
  end

  def show
    @initiative = Initiative.includes(comments: :user).friendly.find(params[:id])
    add_breadcrumb t('views.pages.global.button.show_obj', obj: @initiative.title)
    liqpay(@initiative)
  end

  private

  # OPTIMIZE: need to find another solution
  def liqpay(initiative)
    return unless current_user
    donation = Donation.create(user_id: current_user.id, initiative_id: initiative.id)
    @liqpay_request = Liqpay::Request.new(
      amount: '5',
      currency: 'UAH',
      sandbox: '1', # for testing
      order_id: donation.id,
      description: initiative.short_description,
      result_url: initiative_url(initiative),
      server_url: 'http://localhost/liqpay'
    )
  end
end
