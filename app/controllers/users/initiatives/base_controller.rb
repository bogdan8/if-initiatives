# frozen_string_literal: true

# rubocop:disable Rails/LexicallyScopedActionFilter

module Users
  module Initiatives
    class BaseController < ApplicationController
      before_action :access_granted?, only: %i[show edit update destroy]

      private

      def access_granted?
        initiative = Initiative.friendly.find(params[:initiative_id] || params[:id])
        redirect_to root_path, error: t('unauthorized.manage.all') unless current_user.initiatives.include? initiative
      end
    end
  end
end

# rubocop:enable Rails/LexicallyScopedActionFilter
