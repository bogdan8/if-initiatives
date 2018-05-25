# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  def index
    @initiatives = Initiative.includes(:categories, :attachments).available_everyone.page(params[:page]).per(6)
    add_breadcrumb t('views.pages.global.initiatives'), :initiatives_path
  end

  def show
    add_breadcrumb t('views.pages.global.button.show_obj', obj: @initiative.title)
  end
end
