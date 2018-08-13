# frozen_string_literal: true

# require 'rails_helper'
# TODO: fix test
# feature 'Subscription', type: :feature do
#  let(:subscription) { build(:subscription) }
#
#  feature '#New' do
#    before do
#      visit root_path
#    end

#    scenario 'with correct parameters' do
#      find('#subscription-modal-open').click
#      within '#new_subscription' do
#        fill_in 'subscription_email', with: subscription.email
#      end
#      click_button I18n.t('subscriptions.create.button.create')
#      expect(find('#alert')).to have_text I18n.t('subscriptions.create.success')
#    end
#
#    scenario 'with correct parameters' do
#      find('#subscription-modal-open').click
#      within '#new_subscription' do
#        fill_in 'subscription_email', with: ''
#      end
#      click_button I18n.t('subscriptions.create.button.create')
#      expect(find('#alert')).to have_text I18n.t('errors.messages.blank'), count: 1
#    end
#  end
# end
