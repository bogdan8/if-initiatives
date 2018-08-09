# frozen_string_literal: true

module Admins
  class ContactsController < Admins::BaseController
    def index
      @contacts = Contact.page(params[:page]).per(8)
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to admins_contacts_path, success: t('.success')
    end
  end
end
