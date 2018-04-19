# frozen_string_literal: true

module Administration
  class CategoriesController < Administration::BaseController
    load_and_authorize_resource

    def index
      @categories = Category.page(params[:page]).per(5)
    end

    def show; end

    def new; end

    def create
      if @category.save
        redirect_to [:administration, @category], success: t('controller.category.save')
      else
        flash[:error] = @category.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to [:administration, @category], success: t('controller.category.update')
      else
        flash[:error] = @category.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @category.destroy
        redirect_to administration_categories_path, success: t('controller.category.destroy')
      else
        flash[:error] = @category.errors.full_messages.to_sentence
      end
    end

    private

    def category_params
      params.require(:category).permit(:title, :position)
    end
  end
end
