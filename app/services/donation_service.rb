# frozen_string_literal: true

class DonationService
  def initialize(params)
    @params = params
  end

  def call
    response = Liqpay::Response.new(@params)
    update(response) if response.success?
    create(response)
  end

  private

  def create(response)
    Donation.find(response.order_id).update(
      amount: response.amount,
      status: response.status,
      description: response.description,
      currency: response.currency
    )
  end

  def update(response)
    Donation.find(response.order_id).initiative.update_amount(response.amount)
  end
end
