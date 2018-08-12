# frozen_string_literal: true

require 'rails_helper'

feature 'Comments', type: :feature do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user_id: user.id) }
  let!(:comment) { create(:comment, initiative_id: initiative.id, user_id: user.id) }

  scenario '#Destroy' do
    login_admin_feature(admin)
    visit admins_initiative_path(initiative)
    accept_confirm { click_link I18n.t('admins.initiatives.show.button.destroy'), match: :first }
    expect(find('#alert')).to have_text I18n.t('admins.initiatives.comments.destroy.success')
  end
end
