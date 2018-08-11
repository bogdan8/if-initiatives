# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::ContactsController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:contact) { create(:contact) }

  before(:each) do
    login_admin(admin)
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
      get :destroy, params: { id: contact }
      expect(contacts - 1).to eq(Contact.count)
      expect(response).to redirect_to(admins_contacts_path)
    end
  end
end
