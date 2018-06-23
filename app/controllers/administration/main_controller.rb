# frozen_string_literal: true

module Administration
  class MainController < Administration::BaseController
    def index
      @presenter = Administrations::IndexPresenter.new
    end
  end
end
