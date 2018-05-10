# frozen_string_literal: true

module Administration
  class HomeController < Administration::BaseController
    def index
      @presenter = Administrations::IndexPresenter.new
    end
  end
end

