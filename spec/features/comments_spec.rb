# frozen_string_literal: true

require 'rails_helper'

feature 'Comments', type: :feature do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, state: :fundraising, user_id: user.id) }
  let!(:comment) { create(:comment, initiative_id: initiative.id, user_id: user.id) }
  let(:new_comment) { build(:comment) }
  let!(:new_user) { create(:user, email: Faker::Internet.email) }

  scenario '#Access denied for create' do
    visit initiative_path(initiative)
    expect(page).not_to have_selector('#addComment')
  end

  scenario '#Access granted for create' do
    login_user_feature(user)
    visit initiative_path(initiative)
    expect(find('#addComment'))
  end

  scenario '#Create', js: true do
    login_user_feature(user)
    visit initiative_path(initiative)
    click_button I18n.t('initiatives.show.comments.new.title')
    within '#new_comment' do
      fill_in 'comment_title', with: new_comment.title
      fill_in 'comment_text', with: new_comment.text
    end
    click_button I18n.t('initiatives.show.comments.button.new')
    expect(find('#alert')).to have_text I18n.t('comments.create.success')
  end

  scenario '#Access denied for edit' do
    visit initiative_path(initiative)
    expect(page).not_to have_selector("#edit_comment_#{comment.id}")
  end

  scenario '#Access granted for edit' do
    login_user_feature(user)
    visit initiative_path(initiative)
    expect(find("#edit_comment_#{comment.id}"))
  end

  scenario '#Edit', js: true do
    login_user_feature(user)
    visit initiative_path(initiative)
    find("#edit_comment_tag_#{comment.id}").click
    within "#edit_comment_#{comment.id}" do
      fill_in 'comment_title', with: new_comment.title
      fill_in 'comment_text', with: new_comment.text
    end
    click_button I18n.t('initiatives.show.comments.button.edit')
    expect(find('#alert')).to have_text I18n.t('comments.update.success')
  end

  # the user can not edit the comments by other users
  scenario '#Access denied for other user' do
    login_user_feature(new_user)
    visit initiative_path(initiative)
    expect(page).not_to have_selector("#edit_comment_#{comment.id}")
  end
end
