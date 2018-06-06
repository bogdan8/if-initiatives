# frozen_string_literal: true

class StaticController < ActionController::API
  def index
    render file: 'public/index.html'
  end
end
