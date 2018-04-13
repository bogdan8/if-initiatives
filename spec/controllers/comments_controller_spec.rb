# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:initiative) { create(:initiative, user_id: user.id) }
  let(:comment) { create(:comment, user_id: user.id, initiative_id: initiative.id) }
  before(:each) do
    login_user(user)
  end

  describe 'POST #create' do
    context 'with correct parameters' do
      it 'the number of comments should increse' do
        comments = Comment.count
        post :create, params: { comment: build(:comment).attributes, initiative_id: initiative.slug }
        expect(Comment.count).to eq(comments + 1)
      end
    end
  end
end
