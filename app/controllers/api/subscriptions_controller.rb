# frozen_string_literal: true

module Api
  class SubscriptionsController < ApiController
    def create
      @subscription = Subscription.find(params[:id])
      if @subscription.save
        redirect_to root_path, success: t('controller.subscription.save')
      else
        redirect_to root_path, error: @subscription.errors.full_messages.to_sentence
      end
    end

    private

    def subscription_params
      params.require(:subscription).permit(:email)
    end

    def message(action, success, error)
      render json: { message: { type: :success, text: success } } if action
      render json: { message: { type: :error, text: error } } unless action
    end
  end
end
