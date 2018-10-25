# frozen_string_literal: true

module Admins
  class CategoriesController < Admins::BaseController
    before_action :find_category, only: %i[show edit update destroy]

    def index
      @categories = Category.page(params[:page]).per(8)
    end

    def show; end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to [:admins, @category], success: t('.success')
      else
        render :new
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to [:admins, @category], success: t('.success')
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to %i[admins categories], success: t('.success')
    end

    private

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :position)
    end
  end
end
