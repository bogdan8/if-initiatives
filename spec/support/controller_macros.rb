# frozen_string_literal: true

def login_admin(admin)
  sign_in admin
end

def login_user(user)
  sign_in user
end

def login_user_feature(user)
  visit new_user_session_path
  within '#new_user' do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
  end
  click_button I18n.t('devise.shared.links.sign_in')
  expect(find('#alert')).to have_text I18n.t('devise.sessions.signed_in')
end

def login_admin_feature(admin)
  visit new_admin_session_path
  within '#new_admin' do
    fill_in 'admin_email', with: admin.email
    fill_in 'admin_password', with: admin.password
  end
  click_button I18n.t('devise.shared.links.sign_in')
  expect(find('#alert')).to have_text I18n.t('devise.sessions.signed_in')
end
