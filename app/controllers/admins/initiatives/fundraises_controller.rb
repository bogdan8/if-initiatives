# frozen_string_literal: true

module Admins
  module Initiatives
    class FundraisesController < Admins::Initiatives::BaseController
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.fundraise
          finish_date(@initiative)
          step(@initiative)
          redirect_to admins_initiatives_path, success: t('.success')
        else
          redirect_to admins_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end

      private

      def finish_date(initiative)
        initiative.update(finish_date: Time.current.to_date + @initiative.finish_days)
      end
    end
  end
end
