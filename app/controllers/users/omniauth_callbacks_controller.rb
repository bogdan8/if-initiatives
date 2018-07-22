# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :social_user, only: %i[twitter facebook]

    def twitter; end

    def facebook; end

    private

    def social_user
      user = User.from_omniauth(request.env['omniauth.auth'])
      if user.persisted?
        sign_in_and_redirect user, flash: t('devise.sessions.new.sign_in')
      else
        redirect_to new_user_registration_url
        session['devise.user_attributes'] = user.attributes
      end
    end
  end
end
