# frozen_string_literal: true

module Users
  class UsersController < ApplicationController
    load_and_authorize_resource

    def show
      add_breadcrumb t('.breadcrumb.title', obj: @user.name)
    end
  end
end
