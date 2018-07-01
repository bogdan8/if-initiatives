# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::Initiatives::ImplementionsController, type: :controller do
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
    it 'initiative state should change to implementing instead fundraised' do
      initiative.state = :fundraised
      initiative.save
      post :update, params: { id: initiative.slug, state: :implementing }
      expect(Initiative.find(initiative.id).implementing?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

   it 'initiative state should change to unimplemented instead fundraised' do
      initiative.state = :fundraised
      initiative.save
      post :update, params: { id: initiative.slug, state: :unimplemented }
      expect(Initiative.find(initiative.id).unimplemented?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

   it 'initiative state should change to implemented instead implementing' do
      initiative.state = :implementing
      initiative.save
      post :update, params: { id: initiative.slug, state: :implemented }
      expect(Initiative.find(initiative.id).implemented?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      post :update, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implemented?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end
end
