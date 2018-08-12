# frozen_string_literal: true

require 'rails_helper'

feature 'Initiatives', type: :feature do
  let!(:user) { create(:user) }
  let(:initiative) { build(:initiative) }
  let!(:new_initiative) { create(:initiative, user_id: user.id) }

  scenario '#Access denied' do
    visit new_users_initiative_path
    expect(find('#alert')).to have_text I18n.t('devise.failure.unauthenticated')
  end

  scenario '#Access granted' do
    login_user_feature(user)
    visit new_users_initiative_path
    expect(find('#new_initiative'))
  end

  feature '#Create' do
    before do
      login_user_feature(user)
      visit new_users_initiative_path
    end

    scenario 'with correct parameters' do
      within '#new_initiative' do
        fill_in 'initiative_title', with: initiative.title
        fill_in 'initiative_short_description', with: initiative.short_description
        fill_in 'initiative_long_description', with: initiative.long_description
        fill_in 'initiative_finish_days', with: initiative.finish_days
        fill_in 'initiative_general_sum', with: initiative.general_sum
      end
      click_button I18n.t('users.initiatives.new.title')
      expect(find('#alert')).to have_text I18n.t('users.initiatives.create.success')
    end

    scenario 'with incorrect parameters' do
      within '#new_initiative' do
        fill_in 'initiative_title', with: ''
        fill_in 'initiative_short_description', with: ''
        fill_in 'initiative_long_description', with: ''
        fill_in 'initiative_finish_days', with: ''
        fill_in 'initiative_general_sum', with: ''
      end
      click_button I18n.t('users.initiatives.new.title')
      expect(page).to have_text I18n.t('errors.messages.blank'), count: 5
    end
  end

  feature '#Update' do
    before do
      login_user_feature(user)
      visit edit_users_initiative_path(new_initiative)
    end

    scenario 'with correct parameters' do
      within "#edit_initiative_#{new_initiative.id}" do
        fill_in 'initiative_title', with: initiative.title
        fill_in 'initiative_short_description', with: initiative.short_description
        fill_in 'initiative_long_description', with: initiative.long_description
        fill_in 'initiative_finish_days', with: initiative.finish_days
        fill_in 'initiative_general_sum', with: initiative.general_sum
      end
      click_button I18n.t('users.initiatives.edit.title')
      expect(find('#alert')).to have_text I18n.t('users.initiatives.update.success')
    end

    scenario 'with incorrect parameters' do
      within "#edit_initiative_#{new_initiative.id}" do
        fill_in 'initiative_title', with: ''
        fill_in 'initiative_short_description', with: ''
        fill_in 'initiative_long_description', with: ''
        fill_in 'initiative_finish_days', with: ''
        fill_in 'initiative_general_sum', with: ''
      end
      click_button I18n.t('users.initiatives.edit.title')
      expect(page).to have_text I18n.t('errors.messages.blank'), count: 5
    end
  end
end
