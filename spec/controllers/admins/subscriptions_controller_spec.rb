# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::SubscriptionsController, type: :controller do
  let(:user) { create(:user) }
  let(:subscription) { create(:subscription) }
  before(:each) do
    login_admin(user)
  end

  describe 'GET #index' do
    it 'renders the template with status' do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #destroy' do
    it 'the number of subscriptions should decrease' do
      subscription.save
      subscriptions = Subscription.count
      get :destroy, params: { id: subscription.id }
      expect(subscriptions - 1).to eq(Subscription.count)
      expect(response).to redirect_to(admin_subscriptions_path)
    end
  end
end
