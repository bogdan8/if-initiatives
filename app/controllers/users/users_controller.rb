# frozen_string_literal: true

module Users
  class UsersController < ApplicationController
    def show
      add_breadcrumb t('.breadcrumb.title', obj: @user.name)
    end
  end
end
