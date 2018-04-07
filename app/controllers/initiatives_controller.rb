# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource
  def index
    @initiatives = Initiative.includes(:categories)
  end

  def show; end
end
