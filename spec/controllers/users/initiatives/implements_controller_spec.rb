# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Initiatives::ImplementsController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user, state: :fundraising) }

  before(:each) do
    login_user(user)
  end

  describe 'POST #update' do
    it 'initiative state should change to implement instead of fundraise' do
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implementing?).to eq(true)
      expect(response).to redirect_to(users_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      initiative.update_column(:state, :draft)
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implementing?).to eq(false)
      expect(response).to redirect_to(users_initiatives_path)
    end
  end
end
