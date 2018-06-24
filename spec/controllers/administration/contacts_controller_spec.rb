# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ContactsController, type: :controller do
  let(:user) { create(:user) }
  let(:contact) { create(:contact) }

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

  describe 'GET #destroy' do
    it 'the number of contact us should decrease' do
      contact.save
      contacts = Contact.count
      get :destroy, params: { id: contact.id }
      expect(contacts - 1).to eq(Contact.count)
      expect(response).to redirect_to(administration_contacts_path)
    end
  end
end
