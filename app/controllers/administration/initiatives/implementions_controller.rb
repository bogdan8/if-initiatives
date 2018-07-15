# frozen_string_literal: true

module Administration
  module Initiatives
    class ImplementionsController < Administration::BaseController
      load_and_authorize_resource :initiative
      def index
        @initiative = initiative_with(:implementing)
      end

      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.update(state: params[:state])
          @initiative.steps.create(state: @initiative.state) # create a step for tracking the initiative
          redirect_to administration_initiatives_path,
                      success: t("controller.initiative.to.#{params[:state]}")
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end

      private

      def initiative_with(state)
        Initiative.with_state(state).includes(:categories, :attachments).page(params[:page]).per(5)
      end
    end
  end
end
