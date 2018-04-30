# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let(:subscription) { create(:subscription) }

  describe 'POST #create' do
    it 'the number of subscriptions should increse' do
      subscriptions = Subscription.count
      post :create, params: { subscription: { email: build(:subscription).email } }
      expect(Subscription.count).to eq(subscriptions + 1)
    end
  end
end
