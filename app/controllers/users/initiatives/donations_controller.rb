# frozen_string_literal: true

module Users
  module Initiatives
    class DonationsController < Users::Initiatives::BaseController
      protect_from_forgery except: :create

      def create
        DonationService.new(params).call
        head :ok
      rescue Liqpay::InvalidResponse
        render text: t('.error'), status: :internal_server_error
      end
    end
  end
end
