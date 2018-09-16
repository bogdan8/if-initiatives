# frozen_string_literal: true

require 'rails_helper'

feature 'Archives', type: :feature do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user_id: user.id) }

  feature '#Update' do
    scenario 'from completed' do
      initiative.update_column(:state, :completed)
      login_admin_feature(admin)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.buttons.archive')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.archives.update.success')
    end

    scenario 'from unfulfilled' do
      initiative.update_column(:state, :unfulfilled)
      login_admin_feature(admin)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.buttons.archive')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.archives.update.success')
    end
  end
end
