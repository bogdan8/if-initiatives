# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let(:subscription) { create(:subscription) }

  describe 'POST #create', js: true do
    context 'with correct parameters' do
      it 'the number of subscriptions should increse' do
        subscriptions = Subscription.all.count
        post :create, params: { subscription: build(:subscription).attributes }, format: :js
        expect(Subscription.all.count).to eq(subscriptions + 1)
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the new template' do
        subscriptions = Subscription.all.count
        post :create, params: { subscription: { emails: '' } }, format: :js
        expect(Subscription.all.count).to eq(subscriptions)
      end
    end
  end
end
