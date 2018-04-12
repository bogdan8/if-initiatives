# frozen_string_literal: true

module Administration
  class InitiativesController < ApplicationController
    load_and_authorize_resource find_by: :slug
    before_action :all_categories, only: %i[edit update]

    include AbilityStateToInitiatives

    def index
      @initiatives = Initiative.includes(:categories).page(params[:page]).per(5)
    end

    def show; end

    def edit; end

    def update
      Categorization.where(initiative_id: @initiative.id).delete_all
      add_categories_to_initiative
      if @initiative.update(initiative_params)
        redirect_to [:administration, @initiative], success: t('controller.initiative.update')
      else
        flash[:error] = @initiative.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @initiative.destroy
        redirect_to administration_initiatives_path, success: t('controller.initiative.destroy')
      else
        flash[:error] = @initiative.errors.full_messages.to_sentence
      end
    end

    private

    def initiative_params
      text = %i[title short_description long_description]
      number = %i[finish_days general_sum]
      params.require(:initiative).permit(*text, *number)
    end

    def add_categories_to_initiative
      return if params[:initiative][:category_ids].nil?
      params[:initiative][:category_ids].each do |category|
        @initiative.categorizations.build(category_id: category) unless category.empty?
      end
    end

    def all_categories
      @categories = Category.all
    end
  end
end
