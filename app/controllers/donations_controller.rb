# frozen_string_literal: true

class DonationsController < ApplicationController
  protect_from_forgery except: :liqpay

  def liqpay
    @liqpay_response = Liqpay::Response.new(params)
    if @liqpay_response.success?
      Donation.find(@liqpay_response.order_id).initiative.update_amount(@liqpay_response.amount)
    end
    donation(@liqpay_response)
    head :no_content
  rescue Liqpay::InvalidResponse
    render text: 'Payment error', status: :internal_server_error
  end

  private

  def donation(liqpay)
    Donation.find(liqpay.order_id).update(
      amount: liqpay.amount,
      status: liqpay.status,
      description: liqpay.description,
      currency: liqpay.currency
    )
  end
end
