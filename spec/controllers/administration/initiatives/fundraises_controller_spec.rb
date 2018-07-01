# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::Initiatives::FundraisesController, type: :controller do
  let(:user) { create(:user) }
  let(:initiative) { create(:initiative, user_id: user.id) }

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

  describe 'POST #update' do
    it 'initiative state should change to fundraising instead confirmating' do
      initiative.state = :confirmating
      initiative.save
      post :update, params: { id: initiative.slug, state: :fundraising }
      expect(Initiative.find(initiative.id).fundraising?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should change to fundraised instead fundraising' do
      initiative.state = :fundraising
      initiative.save
      post :update, params: { id: initiative.slug, state: :fundraised }
      expect(Initiative.find(initiative.id).fundraised?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).fundraised?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end
end
