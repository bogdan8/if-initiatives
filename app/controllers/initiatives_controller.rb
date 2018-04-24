# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  add_breadcrumb I18n.t('views.pages.global.home'), :root_path
  def index
    @initiatives = Initiative.includes(:categories).page(params[:page]).per(5)
    add_breadcrumb I18n.t('views.pages.global.initiatives'), :initiatives_path
  end

  def show
    add_breadcrumb t('views.pages.global.button.show_obj', obj: @initiative.title)
  end
end
