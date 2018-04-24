# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb I18n.t('views.pages.global.home'), :root_path

  add_flash_types :success, :danger, :error

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, flash: { error: exception.message } }
      format.js { redirect_to main_app.root_url, flash: { error: exception.message } }
    end
  end
end
