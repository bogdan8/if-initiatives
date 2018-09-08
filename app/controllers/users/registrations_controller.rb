# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
      custom_attributes = %i[name phone age avatar]
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, [*custom_attributes])
    end

    def account_update_params
      custom_attributes = %i[name phone age avatar]
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, [*custom_attributes])
    end
  end
end
