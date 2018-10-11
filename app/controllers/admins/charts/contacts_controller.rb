module Admins
  module Charts
    class ContactsController < Admins::BaseController
      def index
        render json: Contact.group_by_day(:created_at).count
      end
    end
  end
end
