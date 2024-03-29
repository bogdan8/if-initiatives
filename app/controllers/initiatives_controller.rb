# frozen_string_literal: true

class InitiativesController < ApplicationController
  def index
    @q = Initiative.includes(:categories, :attachments).ransack(params[:q])
    @initiatives = @q.result.available_everyone.page(params[:page]).per(12)
    add_breadcrumb t('.breadcrumb.title'), :initiatives_path
  end

  def show
    @initiative = Initiative.includes(comments: :user).friendly.find(params[:id])
    add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
  end
end
