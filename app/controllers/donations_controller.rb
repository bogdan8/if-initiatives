# frozen_string_literal: true

class DonationsController < ApplicationController
  def create
    return unless current_user

    initiative = Initiative.friendly.find(params[:id])
    donation = Donation.create(user_id: current_user.id, initiative_id: initiative.id)
    @liqpay_request = Liqpay::Request.new(
      amount: params[:amount] || '5',
      currency: 'UAH',
      order_id: donation.id,
      description: initiative.short_description,
      result_url: initiative_url(initiative),
      server_url: users_initiative_donations_url(initiative)
    )
    respond_to do |f|
      f.js { render file: 'initiatives/donation' }
    end
  end
end
