# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'renders the template with status' do
      login_admin(user)
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'renders the template with status' do
      login_admin(user)
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #destroy' do
    it 'the number of users should decrease' do
      login_admin(user)
      user.save
      users = User.count
      get :destroy, params: { id: user.id }
      expect(users - 1).to eq(User.count)
      expect(response).to redirect_to(admin_users_path)
    end
  end

  describe 'GET #role' do
    it 'user role should change to admin instead user' do
      login_admin(user)
      user.add_role :user
      user.save
      get :role, params: { id: user.id, role: :admin }
      is_admin = User.last.has_role? :admin
      expect(is_admin).to eq(true)
      expect(response).to redirect_to(admin_users_path)
    end
  end
end
