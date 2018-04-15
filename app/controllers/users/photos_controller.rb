# frozen_string_literal: true

module Users
  class PhotosController < ApplicationController
    load_and_authorize_resource

    def destroy
      Photo.find(params[:id]).destroy
      redirect_to edit_users_initiative_path(params[:initiative_id]), success: 'Фото видалено'
    end
  end
end
