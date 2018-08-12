# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::UsersController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }

  before do
    login_admin(admin)
  end

  describe 'GET #index' do
    it 'renders the template with status' do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'renders the template with status' do
      get :show, params: { id: user }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #destroy' do
    it 'the number of users should decrease' do
      users = User.count
      get :destroy, params: { id: user }
      expect(users - 1).to eq(User.count)
      expect(response).to redirect_to(admins_users_path)
    end
  end
end
