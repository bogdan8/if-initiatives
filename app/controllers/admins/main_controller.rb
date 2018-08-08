# frozen_string_literal: true

module Admins
  class MainController < Admins::BaseController
    def index
      @presenter = Adminss::IndexPresenter.new
    end
  end
end
