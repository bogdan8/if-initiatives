# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @presenter = Categories::ShowPresenter.new(@category)
  end
end
