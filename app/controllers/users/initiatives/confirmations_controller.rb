# frozen_string_literal: true

module Users
  module Initiatives
    class ConfirmationsController < Users::Initiatives::BaseController
      load_resource :initiative

      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.to_confirmating
          step(@initiative)
          redirect_to users_initiatives_path, success: t('.success')
        else
          redirect_to users_initiatives_path, errors: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
