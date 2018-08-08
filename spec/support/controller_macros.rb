# frozen_string_literal: true

def login_admin(user)
  user.add_role :administrator
  sign_in user
end

def login_user(user)
  user.add_role :user
  sign_in user
end

def login_moderator(user)
  user.add_role :moderator
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

def login_admin_feature(user)
  user.add_role :administrator
  visit new_user_session_path
  within '#new_user' do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
  end
  click_button I18n.t('devise.shared.links.sign_in')
  expect(find('#alert')).to have_text I18n.t('devise.sessions.signed_in')
end
