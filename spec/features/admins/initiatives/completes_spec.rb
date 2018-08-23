# frozen_string_literal: true

require 'rails_helper'

feature 'Completes', type: :feature do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user_id: user.id) }

  scenario '#Update' do
    initiative.update_column(:state, :implementing)
    login_admin_feature(admin)
    visit admins_initiatives_path
    click_link I18n.t('admins.initiatives.buttons.complete')
    expect(find('#alert')).to have_text I18n.t('admins.initiatives.completes.update.success')
  end
end
