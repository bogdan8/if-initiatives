# frozen_string_literal: true

module Admins
  module Initiatives
    class ArchivesController < Admins::Initiatives::BaseController
      def update
        return redirect_to %i[admins initiatives], success: t('.success') if current_initiative.archive

        redirect_to %i[admins initiatives], error: current_initiative.errors.full_messages.to_sentence
      end
    end
  end
end
