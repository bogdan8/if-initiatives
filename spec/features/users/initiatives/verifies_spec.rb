# frozen_string_literal: true

require 'rails_helper'

feature 'Comments', type: :feature do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, state: :draft, user_id: user.id) }

  scenario '#Access denied for initiative' do
    visit users_initiative_path(initiative)
    expect(page).not_to have_text initiative.title
  end

  scenario '#Access granted for initiative' do
    login_user_feature(user)
    visit users_initiative_path(initiative)
    expect(page).to have_text initiative.title
  end

  scenario '#New' do
    login_user_feature(user)
    visit users_initiative_path(initiative)
    click_link I18n.t('users.initiatives.buttons.verify')
    expect(find('#alert')).to have_text I18n.t('users.initiatives.verifies.update.success')
  end
end
