# frozen_string_literal: true

module Users
  class AttachmentsController < ApplicationController
    def destroy
      @attachment.destroy
      redirect_to params[:redirect_path], success: t('.success')
    end
  end
end
