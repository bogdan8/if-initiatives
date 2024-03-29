# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::SubscriptionsController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:subscription) { create(:subscription) }

  before(:each) do
    login_admin(admin)
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
      subscriptions = Subscription.count
      get :destroy, params: { id: subscription }
      expect(subscriptions - 1).to eq(Subscription.count)
      expect(response).to redirect_to(admins_subscriptions_path)
    end
  end
end
