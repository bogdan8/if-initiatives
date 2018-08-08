# frozen_string_literal: true

module Admins
  class ContactsController < Admins::BaseController
    def index
      @contacts = Contact.page(params[:page]).per(8)
    end

    def destroy
      @contact.destroy
      redirect_to administration_contacts_path, success: t('.success')
    end
  end
end
