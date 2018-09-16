# frozen_string_literal: true

module Admins
  class MainController < Admins::BaseController
    def index
      @presenter = Admins::IndexPresenter.new
    end
  end
end
