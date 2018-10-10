module Admins
  module Charts
    class UsersController < Admins::BaseController
      def index
        render json: User.group_by_day(:created_at).count
      end
    end
  end
end
