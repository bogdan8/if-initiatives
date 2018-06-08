class DonationsController < ApplicationController

  def create
    @liqpay_response = Liqpay::Response.new(params)

    # if @liqpay_response.success?
      donation(@liqpay_response)
    # end
  rescue Liqpay::InvalidResponse
    render text: 'Payment error', status: 500
  end

  private

  def donation(liqpay)
    Donation.new(
      user_id: 1,
      initiative_id: 2,
      amount: liqpay.amount,
      description: liqpay.description,
      currency: liqpay.currency
    )
  end
end
