# frozen_string_literal: true

require 'rails_helper'

feature 'Categories', type: :feature do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:contact) { create(:contact) }

  feature '#Access denied' do
    scenario 'for unregistered' do
      visit admins_contacts_path
      expect(find('#alert')).to have_text I18n.t('devise.failure.unauthenticated')
    end

    scenario 'for user' do
      login_user_feature(user)
      visit admins_contacts_path
      expect(find('#alert')).to have_text I18n.t('devise.failure.unauthenticated')
    end
  end

  scenario '#Access granted' do
    login_admin_feature(admin)
    visit admins_contacts_path
    expect(page).not_to have_text I18n.t('devise.failure.unauthenticated')
  end

  scenario '#Destroy' do
    login_admin_feature(admin)
    visit admins_contacts_path
    click_link I18n.t('admins.contacts.index.button.destroy')
    expect(page).to have_text I18n.t('admins.contacts.destroy.success')
  end
end
