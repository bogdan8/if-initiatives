# frozen_string_literal: true

module Administration
  class SubscriptionsController < ApplicationController
    load_and_authorize_resource
    add_breadcrumb I18n.t('views.pages.global.subscriptions'), :administration_subscriptions_path
    def index
      @subscriptions = Subscription.page(params[:page]).per(5)
    end

    def destroy
      @subscription.destroy
      redirect_to administration_subscriptions_path, success: t('controller.subscription.destroy')
    end
  end
end
