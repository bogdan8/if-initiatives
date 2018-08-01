# frozen_string_literal: true

module Administration
  module Initiatives
    class LocksController < Administration::Initiatives::BaseController
      load_and_authorize_resource :initiative
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.to_locked
          step(@initiative)
          redirect_to administration_initiatives_path, success: t('success')
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
