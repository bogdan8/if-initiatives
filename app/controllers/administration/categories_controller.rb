# frozen_string_literal: true

module Administration
  class CategoriesController < Administration::BaseController
    load_and_authorize_resource
    add_breadcrumb I18n.t('views.pages.global.categories'), :administration_categories_path

    def index
      @categories = Category.page(params[:page]).per(5)
    end

    def show
      add_breadcrumb t('views.pages.global.button.show_obj', obj: @category.title), [:administration, @category]
    end

    def new
      add_breadcrumb t('views.pages.global.button.new')
    end

    def create
      if @category.save
        redirect_to [:administration, @category], success: t('controller.category.save')
      else
        add_breadcrumb t('views.pages.global.button.new')
        flash[:error] = @category.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit
      add_breadcrumb t('views.pages.global.button.edit_obj', obj: @category.title)
    end

    def update
      if @category.update(category_params)
        redirect_to [:administration, @category], success: t('controller.category.update')
      else
        add_breadcrumb t('views.pages.global.button.edit_obj', obj: @category.title)
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
