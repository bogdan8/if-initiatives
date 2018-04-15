# frozen_string_literal: true

module Users
  class AttachmentsController < ApplicationController
    load_and_authorize_resource

    def destroy
      Attachment.find(params[:id]).destroy
      redirect_to edit_users_initiative_path(params[:initiative_id]), success: 'Файл видалено'
    end
  end
end
