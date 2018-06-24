# frozen_string_literal: true

class MainController < ApplicationController
  respond_to :json
  def index; end

  def search
    @initiatives = Initiative.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    respond_with @initiatives
  end
end
