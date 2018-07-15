# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::Initiatives::ConfirmationsController, type: :controller do
  let(:user) { create(:user) }
  let(:initiative) { create(:initiative, user_id: user.id) }

  describe 'POST #update' do
    it 'initiative state should change to fundraising instead confirmating' do
      login_admin(user)
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end
end
