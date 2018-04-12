# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource find_by: :slug
  def index
    @initiatives = Initiative.includes(:categories).page(params[:page]).per(5)
  end

  def show; end
end
