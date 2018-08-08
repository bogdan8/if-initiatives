# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_initiative, only: %i[create edit update destroy]
  add_breadcrumb I18n.t('.breadcrumb.title'), :initiatives_path

  def create
    @comment = @initiative.comments.new(comment_params)

    if @comment.save
      redirect_to @initiative, success: t('.success')
    else
      add_breadcrumb t('.breadcrumb.title')
      redirect_to @initiative, error: @comment.errors.full_messages.to_sentence
    end
  end

  def edit
    add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
  end

  def update
    if @comment.update(comment_params)
      redirect_to @initiative, success: t('.success')
    else
      add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
      redirect_to @initiative, error: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @comment.destroy
    redirect_to @initiative, success: t('.success')
  end

  private

  def find_initiative
    @initiative = Initiative.friendly.find(params[:initiative_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :text).merge(user_id: current_user.id)
  end
end
