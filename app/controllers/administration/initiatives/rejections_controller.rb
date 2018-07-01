# frozen_string_literal: true

module Administration
  module Initiatives
    class RejectionsController < Administration::BaseController
      load_and_authorize_resource :initiative
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.to_rejected
          @initiative.steps.create(state: @initiative.state) # create a step for tracking the initiative
          redirect_to administration_initiatives_path,
                      success: t('controller.initiative.to_rejected')
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
