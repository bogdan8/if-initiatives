# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  load_resource
  def create
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
end
