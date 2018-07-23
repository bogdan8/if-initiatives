require 'rails_helper'

feature 'Contacts' do
  let(:contact) { build(:contact) }

  scenario '#create' do
    visit new_contact_path
    within '#new_contact' do
      fill_in 'contact_full_name', with: contact.full_name
      fill_in 'contact_email', with: contact.email
      fill_in 'contact_description', with: contact.description
    end
    click_button I18n.t('views.pages.global.button.new')
    expect(page).to have_content: I18n.t('controller.contact.save')
  end
end
