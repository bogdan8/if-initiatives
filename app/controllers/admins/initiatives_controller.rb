# frozen_string_literal: true

module Admins
  class InitiativesController < Admins::BaseController
    before_action :find_initiative, only: %i[show destroy]

    include AbilityStateToInitiatives

    def index
      @q = Initiative.includes(:categories, :attachments).without_draft.ransack(params[:q])
      @initiatives = @q.result.page(params[:page]).per(6)
    end

    def show; end

    def destroy
      @initiative.destroy
      redirect_to %i(admins initiatives), success: t('.success')
    end

    private

    def find_initiative
      @initiative = Initiative.friendly.find(params[:id])
    end
  end
end
