# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do
  let!(:user) { create(:user) }

  before(:each) do
    login_user(user)
  end

  describe 'GET #show' do
    it 'renders the template with status' do
      get :show, params: { id: user }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end
end
