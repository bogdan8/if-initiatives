# frozen_string_literal: true

module Administration
  module Initiatives
    class BaseController < Administration::BaseController
      private

      # create a step for tracking the initiative
      def step(initiative)
        initiative.steps.create(state: initiative.state)
      end
    end
  end
end
