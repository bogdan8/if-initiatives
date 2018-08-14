# frozen_string_literal: true

module Users
  class AttachmentsController < Users::BaseController
    def destroy
      @attachment = Attachment.find(params[:id])
      @attachment.destroy
      redirect_to params[:redirect_path], success: t('.success')
    end
  end
end
