# frozen_string_literal: true

module Admins
  class InitiativesController < Admins::BaseController
    before_action :all_categories, only: %i[edit update]
    before_action :find_initiative, only: %i[show edit update destroy]

    include AbilityStateToInitiatives

    def index
      @q = Initiative.includes(:categories, :attachments).without_draft.ransack(params[:q])
      @initiatives = @q.result.page(params[:page]).per(6)
    end

    def show
      add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
    end

    def edit
      add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
    end

    def update
      Categorization.where(initiative_id: @initiative.id).delete_all
      add_categories_to_initiative
      if @initiative.update(initiative_params)
        redirect_to [:admins, @initiative], success: t('.success')
      else
        add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
        flash[:error] = @initiative.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      @initiative.destroy
      redirect_to admins_initiatives_path, success: t('.success')
    end

    private

    def find_initiative
      @initiative = Initiative.friendly.find(params[:id])
    end

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
