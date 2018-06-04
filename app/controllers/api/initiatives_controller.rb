# frozen_string_literal: true

module Api
  class InitiativesController < ApiController
    def index
      @initiatives = Initiative.includes(:categories, :attachments).available_everyone
      render json: @initiatives.to_json(include: %i[categories attachments])
    end

    def show
      @initiative = Initiative.find(params[:id])
      render json: @initiative
    end
  end
end
