# frozen_string_literal: true

require 'rails_helper'

feature 'Initiatives', type: :feature do
  let!(:user) { create(:user) }
  let(:initiative) { build(:initiative) }

  scenario '#Access denied' do
    visit new_users_initiative_path
    expect(find('#alert')).to have_text I18n.t('unauthorized.manage.all')
  end

  scenario '#Access granted' do
    login_user_feature(user)
    visit new_users_initiative_path
    expect(find('#new_initiative'))
  end

  scenario '#Create' do
    login_user_feature(user)
    visit new_users_initiative_path
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
end
