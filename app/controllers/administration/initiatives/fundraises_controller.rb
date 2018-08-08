# frozen_string_literal: true

module Administration
  module Initiatives
    class FundraisesController < Administration::Initiatives::BaseController
      load_resource :initiative

      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.update(state: params[:state])
          finish_date(@initiative) if @initiative.fundraising?
          step(@initiative)
          redirect_to administration_initiatives_path, success: t(".success.#{params[:state]}")
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end

      private

      def finish_date(initiative)
        initiative.update(finish_date: Time.current.to_date + @initiative.finish_days)
      end

      def initiative_with(state)
        Initiative.with_state(state).includes(:categories, :attachments).page(params[:page]).per(5)
      end
    end
  end
end
