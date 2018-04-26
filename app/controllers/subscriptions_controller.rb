# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  load_and_authorize_resource
  def create
    if @subscription.save
      respond_to do |format|
        format.js { flash[:success] = t('controller.subscription.save') }
      end
    else
      respond_to do |format|
        format.js { flash[:error] = @subscription.errors.full_messages.to_sentence }
      end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
