# frozen_string_litera: true

module Admins
  module Initiatives
    class UnfulfillsController < Admins::Initiatives::BaseController
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.unfulfill
          step(@initiative)
          redirect_to admins_initiatives_path, success: t('.success')
        else
          redirect_to admins_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
