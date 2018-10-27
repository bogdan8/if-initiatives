# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe Users::Initiatives::ReportsController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user, state: :implementing) }

  before(:each) do
    login_user(user)
  end

  describe 'POST #create' do
    context 'with correct parameters' do
      it 'the number of initiatives should increse' do
        reports = Report.count
        post :create, params: { report: build(:report).attributes, initiative_id: initiative }
        expect(Report.count).to eq(reports + 1)
      end
    end

    context 'with incorrect parameters' do
      it 'should renders the new template' do
        post :create, params: { report: build(:report, title: 'test').attributes, initiative_id: initiative }
        expect(response).to redirect_to(users_initiative_path(initiative))
      end
    end
  end

  describe 'POST #update' do
    context 'with correct parameters' do
      it 'values should be changed' do
        initiative.reports.create(attributes_for(:report))
        title = 'new title for report'
        post :update, params: { report: build(:report, title: title).attributes, initiative_id: initiative }
        expect(Report.first.title).to eq(title)
        expect(response).to redirect_to(users_initiative_path(initiative))
        expect(response.status).to eq(200)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
