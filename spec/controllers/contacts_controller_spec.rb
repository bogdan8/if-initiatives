# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:contacts) { create(:contacts) }

  describe 'GET #new' do
    it 'renders the template with status' do
      get :new
      expect(response).to render_template(:new)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'with correct parameters' do
      it 'the number of contacts should increse' do
        contacts = Contact.count
        post :create, params: { contact: build(:contact).attributes }
        expect(Contact.count).to eq(contacts + 1)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the new template' do
        contacts = Contact.count
        post :create, params: { contact: { email: '' } }
        expect(Contact.count).to eq(contacts)
        expect(response).to render_template(:new)
      end
    end
  end
end
