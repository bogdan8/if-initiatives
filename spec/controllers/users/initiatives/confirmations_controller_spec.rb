# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Initiatives::ConfirmationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }

  before(:each) do
    login_user(user)
  end

  describe 'POST #update' do
    it 'initiative state should change to confirmating instead draft' do
      initiative.state = :draft
      initiative.save
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).confirmating?).to eq(true)
      expect(response).to redirect_to(users_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      initiative.state = :implemented
      initiative.save
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).confirmating?).to eq(false)
      expect(response).to redirect_to(users_initiatives_path)
    end
  end
end
