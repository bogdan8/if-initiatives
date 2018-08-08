# frozen_string_literal: true

require 'rails_helper'

feature 'Contacts', type: :feature do
  let(:contact) { build(:contact) }

  feature '#New' do
    before do
      visit new_contact_path
    end

    scenario 'with correct parameters' do
      within '#new_contact' do
        fill_in 'contact_full_name', with: contact.full_name
        fill_in 'contact_email', with: contact.email
        fill_in 'contact_description', with: contact.description
      end
      click_button I18n.t('contacts.new.button.new')
      expect(find('#alert')).to have_text I18n.t('contacts.create.success')
    end

    scenario 'with incorrect parameters' do
      within '#new_contact' do
        fill_in 'contact_full_name', with: ''
        fill_in 'contact_email', with: ''
        fill_in 'contact_description', with: ''
      end
      click_button I18n.t('contacts.new.button.new')
      expect(page).to have_text I18n.t('errors.messages.blank'), count: 3
    end
  end
end
