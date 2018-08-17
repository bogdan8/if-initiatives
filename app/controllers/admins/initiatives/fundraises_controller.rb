# frozen_string_literal: true

module Admins
  module Initiatives
    class FundraisesController < Admins::Initiatives::BaseController
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.update(state: params[:state])
          finish_date(@initiative) if @initiative.fundraising?
          step(@initiative)
          redirect_to admins_initiatives_path, success: t(".success.#{params[:state]}")
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
