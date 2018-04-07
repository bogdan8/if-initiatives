# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InitiativesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:categorization) { create(:categorization) }
  let(:initiative) { create(:initiative, user_id: user.id) }
  describe 'GET #index' do
    it 'renders the template with status' do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'renders the template with status' do
      get :show, params: { id: initiative.id }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end
end
