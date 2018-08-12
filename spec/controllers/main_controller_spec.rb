# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController, type: :controller do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user_id: user.id, title: 'created for search') }

  describe 'GET #index' do
    it 'renders the template with status' do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #search' do
    it 'renders the json with data' do
      get :search, params: { q: 'test' }, format: :json
      expect(response).to be_success
    end
  end
end
