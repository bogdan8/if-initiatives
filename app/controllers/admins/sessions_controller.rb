# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    layout 'admini'
  end
end
