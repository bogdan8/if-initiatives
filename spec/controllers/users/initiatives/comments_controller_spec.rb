# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Initiatives::CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }
  let!(:comment) { create(:comment, user: user, initiative: initiative) }

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

    context 'with incorrect parameters' do
      it 'the number of comments should not increse' do
        comments = Comment.count
        post :create, params: { comment: build(:comment, title: :a).attributes, initiative_id: initiative.slug }
        expect(Comment.count).to eq(comments)
      end end
  end

  describe 'GET #edit' do
    it 'render the template with status' do
      get :edit, params: { id: comment, initiative_id: initiative.slug }
      expect(response).to render_template(:edit)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #update' do
    context 'with correct parameters' do
      it 'value should be changed' do
        title = 'new title for comment'
        post :update, params: { id: comment,
                                comment: build(:comment, title: title).attributes,
                                initiative_id: initiative.slug }
        expect(Comment.last.title).to eq(title)
        expect(response).to redirect_to(initiative_path(initiative.slug))
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the edit template' do
        post :update, params: { id: comment,
                                comment: build(:comment, title: '').attributes,
                                initiative_id: initiative.slug }
        expect(Initiative.last.title).not_to eq('')
        expect(response).to redirect_to(initiative)
      end
    end
  end

  describe 'GET #destroy' do
    it 'the number of comments should decrease' do
      comments = Comment.count
      get :destroy, params: { id: comment, initiative_id: initiative.slug }
      expect(comments - 1).to eq(Comment.count)
      expect(response).to redirect_to(initiative_path(initiative.slug))
    end
  end
end
