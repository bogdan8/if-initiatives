# frozen_string_literal: true

module Users
  class CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :find_initiative, only: %i[create update destroy]

    def edit
      @initiative = @comment.initiative
    end

    def create
      @initiative = Initiative.find(params[:initiative_id])
      @comment = @initiative.comments.new(comment_params)

      if @comment.save
        redirect_to [:users, @initiative], success: 'Comment created'
      else
        redirect_to [:users, @initiative], error: @comment.errors.full_messages.to_sentence
      end
    end

    def update
      if @comment.update(comment_params)
        redirect_to [:users, @initiative], success: 'Comment updated'
      else
        flash[:error] = @comment.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @comment.destroy
        redirect_to [:users, @initiative], success: 'Comment deleted'
      else
        redirect_to [:users, @initiative], error: @comment.errors.full_messages.to_sentence
      end
    end

    private

    def find_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end

    def comment_params
      params.require(:comment).permit(:title, :text).merge(user_id: current_user.id)
    end
  end
end
