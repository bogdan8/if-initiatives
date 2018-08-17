# frozen_string_literal: true

require 'rails_helper'

feature 'Rejections', type: :feature do
  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:initiative) { create(:initiative, user: user) }


  feature '#Update' do
    before do
      login_admin_feature(admin)
    end

    scenario 'fundraising' do
      initiative.update_column(:state, :fundraising)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.rejected')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.rejections.update.success')
      expect(Initiative.last.rejected?)
    end

    scenario 'confirmating' do
      initiative.update_column(:state, :confirmating)
      visit admins_initiatives_path
      click_link I18n.t('admins.initiatives.index.button.rejected')
      expect(find('#alert')).to have_text I18n.t('admins.initiatives.rejections.update.success')
      expect(Initiative.last.rejected?)
    end
  end
end
