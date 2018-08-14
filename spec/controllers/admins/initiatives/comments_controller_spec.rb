# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::Initiatives::CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }
  let!(:initiative) { create(:initiative, user: user) }
  let!(:comment) { create(:comment, user: user, initiative: initiative) }

  describe 'GET #destroy' do
    it 'the number of comments should decrease' do
      login_admin(admin)
      comments = Comment.count
      get :destroy, params: { id: comment, initiative_id: initiative.id }
      expect(comments - 1).to eq(Comment.count)
      expect(response).to redirect_to(admins_initiative_path(initiative.slug))
    end
  end
end
