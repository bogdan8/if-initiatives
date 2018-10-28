# frozen_string_literal: true

# rubocop:disable Naming/MemoizedInstanceVariableName

module Admins
  module Initiatives
    class BaseController < Admins::BaseController
      after_action :step, only: %i[update] # rubocop:disable Rails/LexicallyScopedActionFilter

      helper_method def current_initiative
        @initiative ||= Initiative.friendly.find(params[:initiative_id] || params[:id])
      end

      private

      # Step for tracking the initiatives
      def step
        current_initiative.steps.create(state: current_initiative.state)
      end
    end
  end
end
# rubocop:enable Naming/MemoizedInstanceVariableName
