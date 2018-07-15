# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::Initiatives::RejectionsController, type: :controller do
  let(:user) { create(:user) }
  let(:initiative) { create(:initiative, user_id: user.id) }

  before(:each) do
    login_admin(user)
  end

  describe 'POST #update' do
    it 'initiative state should change to rejected instead confirmating' do
      initiative.state = :confirmating
      initiative.save
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).rejected?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).rejected?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end
end
