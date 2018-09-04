# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
      params.require(:user).permit(:email, :name, :phone, :age, :avatar, :password, :password_confirmation, :current_password)
    end

    def account_update_params
      params.require(:user).permit(:email, :name, :phone, :age, :avatar, :password, :password_confirmation, :current_password)
    end
  end
end
