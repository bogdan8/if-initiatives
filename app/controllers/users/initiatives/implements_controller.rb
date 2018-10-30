# frozen_string_literal: true

module Users
  module Initiatives
    class ImplementsController < Users::Initiatives::BaseController
      def update
        return redirect_to %i[users initiatives], success: t('.success') if current_initiative.implement

        current_initiative.steps.create(state: current_initiative.state)
        redirect_to %i[users initiatives], error: current_initiative.errors.full_messages.to_sentence
      end
    end
  end
end
