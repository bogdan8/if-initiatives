# frozen_string_literal: true

module Admins
  module Initiatives
    class ImplementionsController < Admins::Initiatives::BaseController
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.update(state: params[:state])
          step(@initiative)
          redirect_to admins_initiatives_path, success: t(".success.#{params[:state]}")
        else
          redirect_to admins_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end

      private

      def initiative_with(state)
        Initiative.with_state(state).includes(:categories, :attachments).page(params[:page]).per(5)
      end
    end
  end
end
