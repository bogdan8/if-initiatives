# frozen_string_literal: true

class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :find_initiative, only: %i[create edit update destroy]
  add_breadcrumb I18n.t('views.pages.global.initiatives'), :initiatives_path

  def create
    @comment = @initiative.comments.new(comment_params)

    if @comment.save
      redirect_to @initiative, success: t('controller.comment.save')
    else
      add_breadcrumb t('views.pages.global.button.new')
      redirect_to @initiative, error: @comment.errors.full_messages.to_sentence
    end
  end

  def edit
    add_breadcrumb t('views.pages.global.button.edit_obj', obj: @initiative.title)
  end

  def update
    if @comment.update(comment_params)
      redirect_to @initiative, success: t('controller.comment.update')
    else
      add_breadcrumb t('views.pages.global.button.edit_obj', obj: @initiative.title)
      redirect_to @initiative, error: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @comment.destroy
    redirect_to @initiative, success: t('controller.comment.destroy')
  end

  private

  def find_initiative
    @initiative = Initiative.friendly.find(params[:initiative_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :text).merge(user_id: current_user.id)
  end
end
