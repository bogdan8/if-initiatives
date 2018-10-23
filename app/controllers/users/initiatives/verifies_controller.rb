# frozen_string_literal: true

module Users
  module Initiatives
    class VerifiesController < Users::Initiatives::BaseController
      def update
        if current_initiative.verify
          current_initiative.steps.create(state: current_initiative.state)
          redirect_to users_initiatives_path, success: t('.success')
        else
          redirect_to users_initiatives_path, error: current_initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
