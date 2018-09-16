# frozen_string_literal: true

module Admins
  class InitiativesController < Admins::BaseController
    before_action :find_initiative, only: %i[show destroy]

    include AbilityStateToInitiatives

    def index
      @q = Initiative.includes(:categories, :attachments).without_draft.ransack(params[:q])
      @initiatives = @q.result.page(params[:page]).per(6)
    end

    def show
      add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
    end

    def destroy
      @initiative.destroy
      redirect_to admins_initiatives_path, success: t('.success')
    end

    private

    def find_initiative
      @initiative = Initiative.friendly.find(params[:id])
    end

    def initiative_params
      text = %i[title short_description long_description]
      number = %i[finish_days general_sum]
      params.require(:initiative).permit(*text, *number)
    end
  end
end
