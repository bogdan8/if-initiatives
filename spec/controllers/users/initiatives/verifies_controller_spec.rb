# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Initiatives::VerifiesController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }

  before(:each) do
    login_admin(user)
  end

  describe 'POST #update' do
    it 'initiative state should change to verifying instead of draft' do
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).verifying?).to eq(true)
      expect(response).to redirect_to(users_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      initiative.update_column(:state, :fundraising)
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).verifying?).to eq(false)
      expect(response).to redirect_to(users_initiatives_path)
    end
  end
end
