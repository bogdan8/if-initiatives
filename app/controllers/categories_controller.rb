# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @initiatives = Initiative.available_everyone(:draft, :confirmating, :rejected, :locked).by_category(@category)
  end
end
