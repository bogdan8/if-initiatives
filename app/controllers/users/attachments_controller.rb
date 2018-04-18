# frozen_string_literal: true

module Users
  class AttachmentsController < ApplicationController
    load_and_authorize_resource

    def destroy
      @attachment.destroy
      redirect_to params[:redirect_path], success: t('controller.attachment.destroy')
    end
  end
end
