# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  def index
    @initiatives = Initiative.includes(:categories, :attachments).available_everyone.page(params[:page]).per(6)
    add_breadcrumb t('views.pages.global.initiatives'), :initiatives_path
  end

  def show
    @initiative = Initiative.includes(comments: :user).friendly.find(params[:id])
    add_breadcrumb t('views.pages.global.button.show_obj', obj: @initiative.title)
    @liqpay_request = Liqpay::Request.new(
      amount: '5',
      currency: 'UAH',
      sandbox: '1',
      order_id: rand(50000000000),
      description: @initiative.short_description,
      result_url: donations_url,
      server_url: donations_url
    )
  end
end
