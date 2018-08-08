# frozen_string_literal: true

module Admins
  class CommentsController < Admins::BaseController
    before_action :find_initiative, only: %i[destroy]

    def destroy
      @comment.destroy
      redirect_to [:administration, @initiative], success: t('.success')
    end

    private

    def find_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end
  end
end
