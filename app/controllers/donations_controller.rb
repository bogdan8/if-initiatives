class DonationsController < ApplicationController
  protect_from_forgery except: :liqpay_payment
  
  def liqpay
    @liqpay_response = Liqpay::Response.new(params)
    # if @liqpay_response.success?
      donation(@liqpay_response)
    # end
  rescue Liqpay::InvalidResponse
    render text: 'Payment error', status: 500
  end

  
  private

  def donation(liqpay)
    Donation.find(liqpay.order_id).update(
      amount: liqpay.amount,
      description: liqpay.description,
      currency: liqpay.currency
    )
  end
end
