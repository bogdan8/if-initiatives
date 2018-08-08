# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:initiative) { create(:initiative, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, initiative_id: initiative.id) }

  describe 'GET #destroy' do
    it 'the number of comments should decrease' do
      login_admin(user)
      comment.save
      comments = Comment.count
      get :destroy, params: { id: comment.id, initiative_id: initiative.id }
      expect(comments - 1).to eq(Comment.count)
      expect(response).to redirect_to(admin_initiative_path(initiative.slug))
    end
  end
end
