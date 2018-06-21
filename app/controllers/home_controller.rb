# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def search
    @initiatives = Initiative.ransack(title_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json { @initiatives = @initiatives.limit(10) }
    end
  end
end
