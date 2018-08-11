# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::AttachmentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }
  let!(:attachment) { create(:attachment, initiative: initiative) }

  before(:each) do
    login_user(user)
  end

  describe 'GET #destroy' do
    it 'the number of attachments should decrease' do
      attachment.save
      attachments = Attachment.count
      get :destroy, params: { id: attachment, redirect_path: users_initiatives_path }
      expect(attachments - 1).to eq(Attachment.count)
      expect(response).to redirect_to(users_initiatives_path)
    end
  end
end
