# frozen_string_literal: true

module Administration
  module Initiatives
    class ConfirmationsController < Administration::Initiatives::BaseController
      load_and_authorize_resource :initiative
      def index
        @initiative = initiative_with(:confirmating)
      end

      private

      def initiative_with(state)
        Initiative.with_state(state).includes(:categories, :attachments).page(params[:page]).per(5)
      end
    end
  end
end
