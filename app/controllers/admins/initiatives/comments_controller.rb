# frozen_string_literal: true

module Admins
  module Initiatives
    class CommentsController < Admins::Initiatives::BaseController
      before_action :find_initiative, only: %i[destroy]
      before_action :find_comment, only: %i[destroy]

      def destroy
        @comment.destroy
        redirect_to [:admins, @initiative], success: t('.success')
      end

      private

      def find_comment
        @comment = Comment.find(params[:id])
      end

      def find_initiative
        @initiative = Initiative.find(params[:initiative_id])
      end
    end
  end
end
