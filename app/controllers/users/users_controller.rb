# frozen_string_literal: true

module Users
  class UsersController < Users::BaseController
    def show
      @user = User.find(params[:id])
      @initiatives = @user.initiatives.includes(:categorizations, :categories, :attachments).available_everyone
      add_breadcrumb t('.breadcrumb.title', obj: @user.decorate.full_name)
    end
  end
end
