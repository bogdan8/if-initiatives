# frozen_string_literal: true

module Users
  module Initiatives
    class FundraisesController < ApplicationController
      load_and_authorize_resource :initiative
      def update
        @initiative = Initiative.friendly.find(params[:id])
        if @initiative.to_fundraised
          @initiative.steps.create(state: @initiative.state) # create a step for tracking the initiative
          redirect_to users_initiatives_path,
                      success: t('controller.initiative.to_fundraised')
        else
          redirect_to users_initiatives_path, error: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
