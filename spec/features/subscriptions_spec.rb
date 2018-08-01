# frozen_string_literal: true

require 'rails_helper'

feature 'Subscription', type: :feature do
  let(:subscription) { build(:subscription) }

  scenario '#create', js: true do
    visit root_path
    find('#subscription-modal-open').click
    within '#new_subscription' do
      fill_in 'subscription_email', with: subscription.email
    end
    click_button I18n.t('subscriptions.create.button.create')
    expect(find('#alert')).to have_text I18n.t('subscriptions.create.success')
  end
end
