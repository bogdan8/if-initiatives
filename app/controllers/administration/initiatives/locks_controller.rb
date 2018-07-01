# frozen_string_literal: true

module Administration
  module Initiatives
    class LocksController < Administration::BaseController
      load_and_authorize_resource :initiative
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.to_locked
          @initiative.steps.create(state: @initiative.state)
          redirect_to administration_initiatives_path, success: t('controller.initiative.to.locked')
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
