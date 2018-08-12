# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:initiative) { create(:initiative, user_id: user.id) }

  before(:each) do
    login_user(user)
  end

  describe 'GET #show' do
    it 'renders the template with status' do
      get :show, params: { id: category }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end
end
