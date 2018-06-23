# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe 'GET #index' do
    it 'renders the template with status' do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  #TODO: need to add test for search
end
