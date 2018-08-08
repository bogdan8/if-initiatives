# frozen_string_literal: true

require 'rails_helper'

feature 'Categories', type: :feature do
  let!(:user) { create(:user) }
  let!(:contact) { create(:contact) }

  feature '#Access denied' do
    scenario 'for unregistered' do
      visit administration_contacts_path
      expect(find('#alert')).to have_text I18n.t('unauthorized.manage.all')
    end

    scenario 'for user' do
      login_user_feature(user)
      visit administration_contacts_path
      expect(find('#alert')).to have_text I18n.t('unauthorized.manage.all')
    end
  end

  scenario '#Access granted' do
    login_admin_feature(user)
    visit administration_contacts_path
    expect(page).not_to have_text I18n.t('unauthorized.manage.all')
  end

  scenario '#Destroy' do
    login_admin_feature(user)
    visit administration_contacts_path
    accept_confirm { click_link I18n.t('administration.contacts.index.button.destroy') }
    expect(page).to have_text I18n.t('administration.contacts.destroy.success')
  end
end
