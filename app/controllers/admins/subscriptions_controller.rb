# frozen_string_literal: true

module Admins
  class SubscriptionsController < Admins::BaseController
    def index
      @subscriptions = Subscription.page(params[:page]).per(8)
    end

    def destroy
      @subscription = Subscription.find(params[:id])
      @subscription.destroy
      redirect_to %i[admins subscriptions], success: t('.success')
    end
  end
end
