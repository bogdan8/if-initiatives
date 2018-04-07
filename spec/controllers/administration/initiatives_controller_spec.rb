# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::InitiativesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:categorization) { create(:categorization) }
  let(:initiative) { create(:initiative, user_id: user.id) }
  describe 'GET #index' do
    it 'renders the template with status' do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'renders the template with status' do
      get :show, params: { id: initiative.id }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    it 'renders the template with status' do
      login_user(user)
      get :edit, params: { id: initiative.id }
      expect(response).to render_template(:edit)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #update' do
    context 'with correct parameters' do
      it 'value should be changed' do
        login_user(user)
        user.initiatives.create(attributes_for(:initiative))
        title = 'new title for initiative'
        post :update, params: { id: initiative.id,
                                initiative: build(:initiative, title: title, category_ids: [category.id]).attributes }
        expect(Initiative.last.title).to eq(title)
        expect(response).to redirect_to(administration_initiative_path(initiative.id))
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the edit template' do
        login_user(user)
        user.initiatives.create(attributes_for(:initiative))
        post :update, params: { id: initiative.id,
                                initiative: build(:initiative, title: '', category_ids: [category.id]).attributes }
        expect(Initiative.last.title).not_to eq('')
        expect(response).to render_template(:edit)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #destroy' do
    context 'if admin' do
      it 'the number of initiatives should decrease' do
        login_admin(user)
        initiative.save
        initiatives = Initiative.count
        get :destroy, params: { id: initiative.id }
        expect(initiatives - 1).to eq(Initiative.count)
        expect(response).to redirect_to(administration_initiatives_path)
      end
    end
  end
end
