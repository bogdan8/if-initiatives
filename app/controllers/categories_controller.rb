# frozen_string_literal: true

class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def new; end

  def create
    if @category.save
      redirect_to @category
      flash[:success] = 'Category created'
    else
      flash[:error] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category
      flash[:success] = 'Category Updated'
    else
      flash[:error] = @category.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
      flash[:success] = 'Category Deleted'
    else
      flash[:error] = @category.errors.full_messages.to_sentence
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :position)
  end
end
