# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  before(:each) do
    login_admin(user)
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
      get :show, params: { id: category.id }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    it 'renders the template with status' do
      get :new
      expect(response).to render_template(:new)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'with correct parameters' do
      it 'the number of categories should increse' do
        categories = Category.count
        post :create, params: { category: build(:category).attributes }
        expect(Category.count).to eq(categories + 1)
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the new template' do
        post :create, params: { category: build(:category, title: :t).attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the template with status' do
      get :edit, params: { id: category.id }
      expect(response).to render_template(:edit)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #update' do
    context 'with correct parameters' do
      it 'value should be changed' do
        title = 'new title for category'
        post :update, params: { id: category.id, category: build(:category, title: title).attributes }
        expect(Category.last.title).to eq(title)
        expect(response).to redirect_to(category_path(category.id))
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the edit template' do
        post :update, params: { id: category.id, category: build(:category, title: '').attributes }
        expect(Category.last.title).not_to eq('')
        expect(response).to render_template(:edit)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #destroy' do
    context 'if admin' do
      it 'the number of categories should decrease' do
        category.save
        categories = Category.count
        get :destroy, params: { id: category.id }
        expect(categories - 1).to eq(Category.count)
        expect(response).to redirect_to(categories_path)
      end
    end
  end
end
