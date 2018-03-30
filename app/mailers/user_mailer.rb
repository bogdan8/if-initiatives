# frozen_string_literal: true

class UserMailer < Devise::Mailer
  default from: 'initiatives.mil'

  layout 'mailer'

  def send_password_to_user(user, password)
    @user = user
    @user_password = password
    mail(to: @user.email, subject: 'Ваш тимчасовий пароль.')
  end
end
