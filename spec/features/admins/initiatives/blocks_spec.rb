# frozen_string_literal: true

require 'rails_helper'

feature 'Blocks', type: :feature do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user_id: user.id) }

  feature '#Update' do
    scenario 'from fundraising' do
      initiative.update_column(:state, :fundraising)
      login_admin_feature(admin)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.buttons.block')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.blocks.update.success')
    end

    scenario 'from implementing' do
      initiative.update_column(:state, :implementing)
      login_admin_feature(admin)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.buttons.block')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.blocks.update.success')
    end
  end
end
