# frozen_string_literal: true

require 'rails_helper'

feature 'Subscription', type: :feature do
  let(:subscription) { build(:subscription) }

  scenario '#create' do
    visit root_path
    find('#subscription-modal-open').click
    within '#new_subscription' do
      fill_in 'subscription_email', with: subscription.email
    end
    click_button I18n.t('.layouts.user.subscription.subscription.submit.create')
    expect(find('#alert')).to have_text I18n.t('controller.subscription.save')
  end
end
