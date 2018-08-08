# frozen_string_literal: true

require 'rails_helper'

feature 'Categories', type: :feature do
  let!(:user) { create(:user) }
  let(:category) { build(:category) }

  feature '#Access denied for create' do
    scenario 'for unregistered' do
      visit new_administration_category_path
      expect(find('#alert')).to have_text I18n.t('unauthorized.manage.all')
    end

    scenario 'for user' do
      login_user_feature(user)
      visit new_administration_category_path
      expect(find('#alert')).to have_text I18n.t('unauthorized.manage.all')
    end
  end

  scenario '#Access granted for create' do
    login_admin_feature(user)
    visit new_administration_category_path
    expect(page).to have_text I18n.t('administration.categories.form.button.new')
  end

  feature '#New' do
    before do
      login_admin_feature(user)
      visit new_administration_category_path
    end

    scenario 'with correct parameters' do
      within '#new_category' do
        fill_in 'category_title', with: category.title
        fill_in 'category_position', with: category.position
      end
      click_button I18n.t('administration.categories.form.button.new')
      expect(find('#alert')).to have_text I18n.t('administration.categories.create.success')
    end

    scenario 'with incorrect parameters' do
      within '#new_category' do
        fill_in 'category_title', with: ''
        fill_in 'category_position', with: ''
      end
      click_button I18n.t('administration.categories.form.button.new')
      expect(page).to have_text I18n.t('errors.messages.blank'), count: 2
    end
  end

  feature '#Edit' do
    let!(:category) { create(:category) }

    before do
      login_admin_feature(user)
      visit edit_administration_category_path(category.id)
    end

    scenario 'with correct parameters' do
      within "#edit_category_#{category.id}" do
        fill_in 'category_title', with: category.title
        fill_in 'category_position', with: category.position
      end
      click_button I18n.t('administration.categories.form.button.edit')
      expect(find('#alert')).to have_text I18n.t('administration.categories.update.success')
    end

    scenario 'with incorrect parameters' do
      within "#edit_category_#{category.id}" do
        fill_in 'category_title', with: ''
        fill_in 'category_position', with: ''
      end
      click_button I18n.t('administration.categories.form.button.edit')
      expect(page).to have_text I18n.t('errors.messages.blank'), count: 2
    end
  end

  scenario '#Destroy' do
    category.save
    login_admin_feature(user)
    visit administration_categories_path
    accept_confirm { click_link I18n.t('administration.categories.index.button.destroy') }
    expect(page).to have_text I18n.t('administration.categories.destroy.success')
  end
end
