# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let(:subscription) { create(:subscription) }

  describe 'POST #create' do
    context 'with correct parameters' do
      it 'the number of subscriptions should increse' do
        subscriptions = Subscription.count
        post :create, params: { subscription: build(:subscription).attributes }
        expect(Subscription.count).to eq(subscriptions + 1)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with incorrect parameters' do
      it 'should reneres the new template' do
        subscriptions = Subscription.count
        post :create, params: { subscription: { emails: '' } }
        expect(Subscription.count).to eq(subscriptions)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
