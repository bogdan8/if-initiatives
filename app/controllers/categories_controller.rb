# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.includes(:categorizations, initiatives: :attachments).find(params[:id])
    @presenter = Categories::ShowPresenter.new(@category)
  end
end
