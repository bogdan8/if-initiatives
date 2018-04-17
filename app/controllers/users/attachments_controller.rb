# frozen_string_literal: true

module Users
  class AttachmentsController < ApplicationController
    load_and_authorize_resource

    def destroy
      Attachment.find(params[:id]).destroy
      redirect_to params[:redirect_path], success: 'Файл видалено'
    end
  end
end
