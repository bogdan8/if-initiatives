# frozen_string_literal: true

module Administration
  module Initiatives
    class RejectionsController < Administration::Initiatives::BaseController
      load_resource :initiative

      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.to_rejected
          step(@initiative)
          redirect_to administration_initiatives_path, success: t('success')
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
