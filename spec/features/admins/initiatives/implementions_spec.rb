# frozen_string_literal: true

require 'rails_helper'

feature 'Implementions', type: :feature do
  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }

  feature '#Update' do
    before do
      login_admin_feature(admin)
      initiative.update_column(:state, :fundraised)
    end

    scenario 'implementing' do
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.implementing')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.implementions.update.success.implementing')
      expect(Initiative.last.implementing?)
    end

    scenario 'unimplementing' do
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.unimplemented')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.implementions.update.success.unimplemented')
      expect(Initiative.last.unimplemented?)
    end
  end
end
