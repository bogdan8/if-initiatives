# frozen_string_literal: true

module Admins
  module Initiatives
    class CommentsController < Admins::Initiatives::BaseController
      before_action :find_comment, only: %i[destroy]

      def destroy
        @comment.destroy
        redirect_to [:admins, current_initiative], success: t('.success')
      end

      private

      def find_comment
        @comment = Comment.find(params[:id])
      end
    end
  end
end
