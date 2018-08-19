# frozen_string_literal: true

module Users
  module Initiatives
    class VerifiesController < Users::Initiatives::BaseController
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.verify
          step(@initiative)
          redirect_to users_initiatives_path, success: t('.success')
        else
          redirect_to users_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end