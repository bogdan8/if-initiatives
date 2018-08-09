# frozen_string_literal: true

module Admins
  class BaseController < ApplicationController
    layout 'admini'
    before_action :authenticate_admin!
  end
end
