# frozen_string_literal: true

module Admins
  module Charts
    class SubscriptionsController < Admins::BaseController
      def index
        render json: Subscription.group_by_day(:created_at).count
      end
    end
  end
end
