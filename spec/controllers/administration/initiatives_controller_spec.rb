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
      get :show, params: { id: initiative.slug }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    it 'renders the template with status' do
      login_user(user)
      get :edit, params: { id: initiative.slug }
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
        post :update, params: { id: initiative.slug,
                                initiative: build(:initiative, title: title, category_ids: [category.id]).attributes }
        expect(Initiative.last.title).to eq(title)
        expect(response).to redirect_to(administration_initiative_path(initiative.slug))
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the edit template' do
        login_user(user)
        user.initiatives.create(attributes_for(:initiative))
        post :update, params: { id: initiative.slug,
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
        get :destroy, params: { id: initiative.slug }
        expect(initiatives - 1).to eq(Initiative.count)
        expect(response).to redirect_to(administration_initiatives_path)
      end
    end
  end

  describe 'GET #to_fundraising' do
    it 'initiative state should change to fundraising instead confirmating' do
      login_admin(user)
      initiative.state = :confirmating
      initiative.save
      get :to_fundraising, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).fundraising?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      initiative.state = :draft
      initiative.save
      get :to_fundraising, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).fundraising?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_rejected' do
    it 'initiative state should change to rejected instead confirmating' do
      login_admin(user)
      initiative.state = :confirmating
      initiative.save
      get :to_rejected, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).rejected?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      get :to_rejected, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).rejected?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_rejected' do
    it 'initiative state should change to rejected instead fundraising' do
      login_admin(user)
      initiative.state = :fundraising
      initiative.save
      get :to_rejected, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).rejected?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      get :to_rejected, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).rejected?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_fundraised' do
    it 'initiative state should change to fundraised instead fundraising' do
      login_admin(user)
      initiative.state = :fundraising
      initiative.save
      get :to_fundraised, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).fundraised?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      get :to_fundraised, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).fundraised?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_implementing' do
    it 'initiative state should change to implementing instead fundraised' do
      login_admin(user)
      initiative.state = :fundraised
      initiative.save
      get :to_implementing, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implementing?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      get :to_implementing, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implementing?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_unimplemented' do
    it 'initiative state should change to unimplemented instead fundraised' do
      login_admin(user)
      initiative.state = :fundraised
      initiative.save
      get :to_unimplemented, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).unimplemented?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      get :to_unimplemented, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).unimplemented?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_implemented' do
    it 'initiative state should change to implemented instead implementing' do
      login_admin(user)
      initiative.state = :implementing
      initiative.save
      get :to_implemented, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implemented?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      get :to_implemented, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).implemented?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #to_locked' do
    it 'initiative state should change to locked instead fundraising' do
      login_admin(user)
      initiative.state = :fundraising
      initiative.save
      get :to_locked, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).locked?).to eq(true)
      expect(response).to redirect_to(administration_initiatives_path)
    end

    it 'initiative state should not change if wrong state' do
      login_admin(user)
      initiative.state = :implemented
      initiative.save
      get :to_locked, params: { id: initiative.slug }
      expect(Initiative.find(initiative.id).locked?).to eq(false)
      expect(response).to redirect_to(administration_initiatives_path)
    end
  end

  describe 'GET #confirmating' do
    it 'renders the template with status' do
      login_admin(user)
      get :confirmating
      expect(response).to render_template(:confirmating)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #fundraising' do
    it 'renders the template with status' do
      login_admin(user)
      get :fundraising
      expect(response).to render_template(:fundraising)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #implementing' do
    it 'renders the template with status' do
      login_admin(user)
      get :implementing
      expect(response).to render_template(:implementing)
      expect(response.status).to eq(200)
    end
  end
end
