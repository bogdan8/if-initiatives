module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :age])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :age])
    end
  end
end