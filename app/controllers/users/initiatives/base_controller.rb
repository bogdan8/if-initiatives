# frozen_string_literal: true

module Users
  module Initiatives
    class BaseController < ApplicationController
      private

      # create a step for tracking the initiative
      def step(initiative)
        initiative.steps.create(state: initiative.state)
      end
    end
  end
end
