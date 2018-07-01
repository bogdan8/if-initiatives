# frozen_string_literal: true

module Administration
  module Initiatives
    class FundraisesController < Administration::BaseController
      load_and_authorize_resource :initiative
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.update(state: params[:state])
          for_fundraising(@initiative) if @initiative.fundraising?
          @initiative.steps.create(state: @initiative.state) # create a step for tracking the initiative
          redirect_to administration_initiatives_path,
                      success: t("controller.initiative.to.#{params[:state]}")
        else
          redirect_to administration_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end

      private

      def for_fundraising(initiative)
        initiative.update(finish_date: Time.current.to_date + @initiative.finish_days)
      end
    end
  end
end
