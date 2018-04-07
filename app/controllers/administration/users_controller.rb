# frozen_string_literal: true

module Administration
  class UsersController < ApplicationController
    load_and_authorize_resource

    def index
      @users = User.includes(:roles).page(params[:page]).per(5)
      @roles = Role.all
    end

    def show; end

    def destroy
      if @user.destroy
        redirect_to administration_users_path, success: 'User deleted'
      else
        flash[:error] = @user.errors.full_messages.to_sentence
      end
    end

    # method for change role in user
    def role
      @user.roles.destroy_all
      if @user.add_role params[:role]
        redirect_to administration_users_path, success: 'Role changed'
      else
        flash[:error] = @user.errors.full_messages.to_sentence
      end
    end
  end
end
