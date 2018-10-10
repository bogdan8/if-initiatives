module Admins
  module Charts
    class InitiativesController < Admins::BaseController
      def index
        render json: Initiative.group_by_day(:created_at).count
      end
    end
  end
end
