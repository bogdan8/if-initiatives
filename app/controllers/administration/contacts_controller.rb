# frozen_string_literal: true

module Administration
  class ContactsController < Administration::BaseController
    load_and_authorize_resource
    add_breadcrumb I18n.t('views.pages.global.contacts'), :administration_contacts_path
    def index
      @contacts = Contact.page(params[:page]).per(8)
    end

    def destroy
      @contact.destroy
      redirect_to administration_contacts_path, success: t('controller.contact.destroy')
    end
  end
end
