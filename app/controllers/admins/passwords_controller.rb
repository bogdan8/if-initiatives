# frozen_string_literal: true

module Admins
  class PasswordsController < Devise::PasswordsController
    layout 'admini'
  end
end
