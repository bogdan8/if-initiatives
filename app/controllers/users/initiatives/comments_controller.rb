# frozen_string_literal: true

module Users
  module Initiatives
    class CommentsController < Users::Initiatives::BaseController
      before_action :find_comment, only: %i[edit update destroy]
      add_breadcrumb I18n.t('.breadcrumb.title'), :initiatives_path

      def create
        @comment = current_initiative.comments.new(comment_params)

        return redirect_to current_initiative, success: t('.success') if @comment.save

        add_breadcrumb t('.breadcrumb.title')
        redirect_to current_initiative, error: @comment.errors.full_messages.to_sentence
      end

      def edit
        add_breadcrumb t('.breadcrumb.title', obj: current_initiative.title)
      end

      def update
        return redirect_to current_initiative, success: t('.success') if @comment.update(comment_params)

        add_breadcrumb t('.breadcrumb.title', obj: current_initiative.title)
        redirect_to current_initiative, error: @comment.errors.full_messages.to_sentence
      end

      def destroy
        @comment.destroy
        redirect_to current_initiative, success: t('.success')
      end

      private

      def find_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:title, :text).merge(user_id: current_user.id)
      end
    end
  end
end
