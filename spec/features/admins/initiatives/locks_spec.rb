# frozen_string_literal: true

require 'rails_helper'

feature 'Locks', types: :feature do
  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }

  feature '#Update' do
    before do
      login_admin_feature(admin)
    end

    scenario 'confirmating to locks' do
      initiative.update_column(:state, :confirmating)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.lock')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.locks.update.success')
      expect(Initiative.last.locked?)
    end

    scenario 'rejected to locks' do
      initiative.update_column(:state, :rejected)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.lock')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.locks.update.success')
      expect(Initiative.last.locked?)
    end

    scenario 'fundraising to locks' do
      initiative.update_column(:state, :fundraising)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.lock')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.locks.update.success')
      expect(Initiative.last.locked?)
    end

    scenario 'fundraised to locks' do
      initiative.update_column(:state, :fundraised)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.lock')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.locks.update.success')
      expect(Initiative.last.locked?)
    end

    scenario 'implementing to locks' do
      initiative.update_column(:state, :implementing)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.lock')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.locks.update.success')
      expect(Initiative.last.locked?)
    end
  end
end
