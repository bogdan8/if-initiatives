# frozen_string_literal: true

require 'rails_helper'

feature 'Comments', type: :feature do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, state: :fundraising, user_id: user.id) }
  let!(:comment) { create(:comment, initiative_id: initiative.id, user_id: user.id) }
  let(:new_comment) { build(:comment) }

  scenario '#Access denied' do
    visit initiative_path(initiative)
    expect(page).not_to have_selector('#addComment')
  end

  scenario '#Access granted' do
    login_user_feature(user)
    visit initiative_path(initiative)
    expect(find('#addComment'))
  end

  scenario '#Create' do
    login_user_feature(user)
    visit initiative_path(initiative)
    click_button I18n.t('views.pages.comments.new.title')
    within '#new_comment' do
      fill_in 'comment_title', with: new_comment.title
      fill_in 'comment_text', with: new_comment.text
    end
    click_button I18n.t('views.pages.global.button.new')
    expect(find('#alert')).to have_text I18n.t('controller.comment.save')
  end
end
