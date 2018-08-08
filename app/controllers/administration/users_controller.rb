# frozen_string_literal: true

module Administration
  class UsersController < Administration::BaseController
    load_resource
    before_action :user_presenter, only: %i[index show]

    def index
      @users = User.includes(:roles).page(params[:page]).per(8)
    end

    def show
      add_breadcrumb t('.breadcrumb.title', obj: @user.name)
    end

    def destroy
      @user.destroy
      redirect_to administration_users_path, success: t('.success')
    end

    # method for change role in user
    def role
      @user.roles.destroy_all
      if @user.add_role params[:role]
        redirect_to administration_users_path, success: t('.success')
      else
        redirect_to administration_users_path, error: @user.errors.full_messages.to_sentence
      end
    end

    private

    def user_presenter
      @presenter = Users::IndexPresenter.new
    end
  end
end
