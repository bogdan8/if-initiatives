# frozen_string_literal: true

require 'rails_helper'

feature 'Categories', type: :feature do
  let!(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user_id: user.id) }
  let!(:comment) { create(:comment, initiative_id: initiative.id, user_id: user.id) }

  scenario '#Destroy' do
    login_admin_feature(user)
    visit administration_initiative_path(initiative)
    accept_confirm { click_link I18n.t('administration.initiatives.show.button.destroy'), match: :first }
    expect(find('#alert')).to have_text I18n.t('administration.comments.destroy.success')
  end
end
