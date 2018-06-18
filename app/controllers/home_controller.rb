# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def search
    @initiatives = Initiative.search(params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @initiatives = @initiatives.limit(10)
      }
    end
  end
end
