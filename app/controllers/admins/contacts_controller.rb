# frozen_string_literal: true

module Admins
  class ContactsController < Admins::BaseController
    def index
      @contacts = Contact.page(params[:page]).per(8)
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to %i[admins contacts], success: t('.success')
    end
  end
end
