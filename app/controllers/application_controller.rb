# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb I18n.t('.breadcrumb.title'), :root_path

  add_flash_types :success, :danger, :error
end
