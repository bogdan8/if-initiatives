# frozen_string_literal: true

class UserMailer < Devise::Mailer
  default from: 'initiatives.mil'

  layout 'mailer'

  def send_password_to_user(user, password)
    @user = user
    @user_password = password
    mail(to: @user.email, subject: t('mail.user.password.temporary.subject'))
  end
end
