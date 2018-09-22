# frozen_string_literal: true

module Admins
  module Initiatives
    class BaseController < Admins::BaseController
      after_action :step, only: %i[update] # rubocop:disable Rails/LexicallyScopedActionFilter

      private

      # Step for tracking the initiatives
      def step
        @initiative.steps.create(state: @initiative.state)
      end
    end
  end
end
