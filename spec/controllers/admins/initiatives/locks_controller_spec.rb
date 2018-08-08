# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::Initiatives::LocksController, type: :controller do
  let(:user) { create(:user) }
  let(:initiative) { create(:initiative, user_id: user.id) }

  before(:each) do
    login_admin(user)
  end

  describe 'POST #update' do
    it 'initiative state should change to locked instead fundraising' do
      initiative.state = :fundraising
      initiative.save
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).locked?).to eq(true)
      expect(response).to redirect_to(admin_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      initiative.state = :implemented
      initiative.save
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).locked?).to eq(false)
      expect(response).to redirect_to(admin_initiatives_path)
    end
  end
end
