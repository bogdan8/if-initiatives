# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::Initiatives::UnfulfillsController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }

  before(:each) do
    login_admin(admin)
  end

  describe 'POST #update' do
    it 'initiative state should change to unfulfilled instead of implementing' do
      initiative.update_column(:state, :implementing)
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).unfulfilled?).to eq(true)
      expect(response).to redirect_to(admins_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).unfulfilled?).to eq(false)
      expect(response).to redirect_to(admins_initiatives_path)
    end
  end
end
