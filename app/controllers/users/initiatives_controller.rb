# frozen_string_literal: true

module Users
  class InitiativesController < ApplicationController
    load_and_authorize_resource find_by: :slug
    before_action :all_categories, only: %i[new create edit update]
    add_breadcrumb I18n.t('views.pages.global.initiatives'), :users_initiatives_path

    include AbilityStateToInitiatives

    def index
      @initiatives = current_user.initiatives.includes(:categories).page(params[:page]).per(5)
    end

    def show
      add_breadcrumb t('views.pages.global.button.show_obj', obj: @initiative.title)
    end

    def new
      add_breadcrumb t('views.pages.global.button.new')
      @initiative = current_user.initiatives.build
    end

    def create
      @initiative = current_user.initiatives.new(initiative_params)
      add_categories_to_initiative
      if @initiative.save
        redirect_to [:users, @initiative], success: t('controller.initiative.save')
      else
        add_breadcrumb t('views.pages.global.button.new')
        flash[:error] = @initiative.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit
      add_breadcrumb t('views.pages.global.button.edit_obj', obj: @initiative.title)
    end

    def update
      Categorization.where(initiative_id: @initiative.id).delete_all
      add_categories_to_initiative
      if @initiative.update(initiative_params)
        redirect_to [:users, @initiative], success: t('controller.initiative.update')
      else
        add_breadcrumb t('views.pages.global.button.edit_obj', obj: @initiative.title)
        flash[:error] = @initiative.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      if @initiative.destroy
        redirect_to users_initiatives_path, success: t('controller.initiative.destroy')
      else
        flash[:error] = @initiative.errors.full_messages.to_sentence
      end
    end

    private

    def initiative_params
      text = %i[title short_description long_description]
      number = %i[finish_days general_sum]
      attachments = %i[id image video _destroy]
      params.require(:initiative).permit(*text, *number, attachments_attributes: [*attachments])
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
