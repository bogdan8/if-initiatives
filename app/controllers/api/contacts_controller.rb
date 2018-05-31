# frozen_string_literal: true

module Api
  class ContactsController < ApiController
    def create
      @contact = Contact.find(params[:id])
      message(@contact.save, t('controller.contact.save'), @contact.errors.full_messages.to_sentece)
    end

    private

    def contact_params
      params.require(:contact).permit(:full_name, :email, :description)
    end

    def message(action, success, error)
      render json: { message: { type: :success, text: success } } if action
      render json: { message: { type: :error, text: error } } unless action
    end
  end
end
