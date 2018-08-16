# frozen_string_literal: true

require 'rails_helper'

feature 'Fundraises', type: :feature do
  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }

  feature '#Update' do
    before do
      login_admin_feature(admin)
    end

    scenario 'fundraising' do
      initiative.update_column(:state, :confirmating)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.confirmed')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.fundraises.update.success.fundraising')
      expect(Initiative.last.fundraising?)
    end

    scenario 'fundraised' do
      initiative.update_column(:state, :fundraising)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.fundraised')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.fundraises.update.success.fundraised')
      expect(Initiative.last.fundraised?)
    end

  end
end
