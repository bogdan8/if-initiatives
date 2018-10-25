# frozen_string_literal: true

module Admins
  class UsersController < Admins::BaseController
    before_action :user_presenter, only: %i[index show]
    before_action :find_user, only: %i[show destroy]

    def index
      @users = User.page(params[:page]).per(8)
    end

    def show; end

    def destroy
      @user.destroy
      redirect_to %i(admins users), success: t('.success')
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_presenter
      @presenter = Users::IndexPresenter.new
    end
  end
end
