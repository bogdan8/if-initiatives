# frozen_string_literal: true

module Admins
  class CategoriesController < Admins::BaseController
    before_action :find_category, only: %i[show edit update destroy]

    def index
      @categories = Category.page(params[:page]).per(8)
    end

    def show
      add_breadcrumb t('.breadcrumb.title', obj: @category.title), [:administration, @category]
    end

    def new
      @category = Category.new
      add_breadcrumb t('.breadcrumb.title')
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to [:administration, @category], success: t('.success')
      else
        add_breadcrumb t('.breadcrumb.title')
        render :new
      end
    end

    def edit
      add_breadcrumb t('.breadcrumb.title', obj: @category.title)
    end

    def update
      if @category.update(category_params)
        redirect_to [:administration, @category], success: t('.success')
      else
        add_breadcrumb t('.breadcrumb.title', obj: @category.title)
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to administration_categories_path, success: t('.success')
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
