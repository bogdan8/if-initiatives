# frozen_string_literal: true

module Administration
  class CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :find_initiative, only: %i[destroy]

    def destroy
      if @comment.destroy
        redirect_to [:administration, @initiative], success: t('controller.comment.destroy')
      else
        redirect_to [:administration, @initiative], error: @comment.errors.full_messages.to_sentence
      end
    end

    private

    def find_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end
  end
end
