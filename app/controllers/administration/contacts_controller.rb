# frozen_string_literal: true

module Administration
  class ContactsController < Administration::BaseController
    load_and_authorize_resource
    add_breadcrumb I18n.t('views.pages.global.contacts'), :administration_contacts_path
    def index
      @contacts = Contact.page(params[:page]).per(5)
    end
  end
end
