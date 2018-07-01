# frozen_string_literal: true

module Users
  module Initiatives
    class ConfirmationsController < ApplicationController
      load_and_authorize_resource :initiative
      def update
        @initiative = Initiative.find(params[:id])
        if @initiative.to_confirmating
          initiative.steps.create(state: @initiative.state) # create a step for tracking the initiative
          redirect_to users_initiatives_path, success: t('controller.initiative.to_confirmating')
        else
          redirect_to users_initiatives_path, errors: @initiative.errors.full_messages.to_sentence
        end
      end
    end
  end
end
