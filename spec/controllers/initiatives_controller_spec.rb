# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::InitiativesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:categorization) { create(:categorization) }
  let(:initiative) { create(:initiative, user_id: user.id) }

  before(:each) do
    login_user(user)
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
      get :show, params: { id: initiative.slug }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #new' do
    it 'renders the template with status' do
      get :new, params: { id: initiative.slug }
      expect(response).to render_template(:new)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'with correct parameters' do
      it 'the number of initiatives should increse' do
        initiatives = Initiative.count
        post :create, params: { initiative: build(:initiative, category_ids: [category.id]).attributes }
        expect(Initiative.count).to eq(initiatives + 1)
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the new template' do
        post :create, params: { initiative: build(:initiative, long_description: :test).attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the template with status' do
      get :edit, params: { id: initiative.slug }
      expect(response).to render_template(:edit)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #update' do
    context 'with correct parameters' do
      it 'value should be changed' do
        user.initiatives.create(attributes_for(:initiative))
        title = 'new title for initiative'
        post :update, params: { id: initiative.slug,
                                initiative: build(:initiative, title: title, category_ids: [category.id]).attributes }
        expect(Initiative.last.title).to eq(title)
        expect(response).to redirect_to(users_initiative_path(initiative.slug))
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the edit template' do
        user.initiatives.create(attributes_for(:initiative))
        post :update, params: { id: initiative.slug,
                                initiative: build(:initiative, title: '', category_ids: [category.id]).attributes }
        expect(Initiative.last.title).not_to eq('')
        expect(response).to render_template(:edit)
        expect(response.status).to eq(200)
      end
    end
  end
end
