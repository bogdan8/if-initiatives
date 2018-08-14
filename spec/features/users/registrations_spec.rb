# frozen_string_literal: true

require 'rails_helper'

feature 'Registration', type: :feature do
  let(:user) { create(:user) }

  scenario '#Access denied' do
    visit edit_user_registration_path
    expect(find('#alert')).to have_text I18n.t('devise.failure.unauthenticated')
  end

  scenario '#Access granted' do
    login_user_feature(user)
    visit edit_user_registration_path
    expect(find('#edit_user'))
  end

  feature '#Edit' do
    before do
      login_user_feature(user)
      visit edit_user_registration_path
    end

    scenario 'with correct parameters' do
      within '#edit_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_name', with: user.name
        fill_in 'user_phone', with: user.phone
        fill_in 'user_age', with: user.age
        fill_in 'user_current_password', with: user.password
      end
      click_button I18n.t('devise.registrations.edit.update')
      expect(find('#alert')).to have_text I18n.t('devise.registrations.updated')
    end

    scenario 'with incorrect parameters' do
      within '#edit_user' do
        fill_in 'user_email', with: ''
        fill_in 'user_name', with: ''
        fill_in 'user_phone', with: ''
        fill_in 'user_age', with: ''
        fill_in 'user_current_password', with: ''
      end
      click_button I18n.t('devise.registrations.edit.update')
      expect(page).to have_text I18n.t('errors.messages.blank'), count: 2
    end
  end
end
