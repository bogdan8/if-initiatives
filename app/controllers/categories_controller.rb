# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    states = %i(draft confirmating rejected locked)
    @category = Category.find(params[:id])
    @initiatives = Initiative.available_everyone(states).by_category(@category)
  end
end
