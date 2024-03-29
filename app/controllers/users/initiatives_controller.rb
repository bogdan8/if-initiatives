# frozen_string_literal: true

module Users
  class InitiativesController < Users::BaseController
    before_action :all_categories, only: %i[new create edit update]
    before_action :find_initiative, only: %i[edit update destroy]
    before_action :access_granted?, only: %i[show edit update destroy]
    add_breadcrumb I18n.t('.initiatives.breadcrumb.title'), :users_initiatives_path
    include AbilityStateToInitiatives

    def index
      @q = current_user.initiatives.includes(:categories, :attachments).order(:id).ransack(params[:q])
      @initiatives = @q.result.page(params[:page]).per(6)
    end

    def show
      @initiative = Initiative.includes(comments: :user).friendly.find(params[:id])
      add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
    end

    def new
      add_breadcrumb t('.breadcrumb.title')
      @initiative = current_user.initiatives.build
    end

    def create
      @initiative = current_user.initiatives.new(initiative_params)
      add_categories_to_initiative
      if @initiative.save
        redirect_to [:users, @initiative], success: t('.success')
      else
        add_breadcrumb t('.breadcrumb.title')
        render :new
      end
    end

    def edit
      add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
    end

    def update
      Categorization.where(initiative_id: @initiative.id).delete_all
      add_categories_to_initiative
      if @initiative.update(initiative_params)
        redirect_to [:users, @initiative], success: t('.success')
      else
        add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
        render :edit
      end
    end

    def destroy
      @initiative.destroy
      redirect_to users_initiatives_path(page: params[:page]), success: t('.success')
    end

    private

    def find_initiative
      @initiative = Initiative.friendly.find(params[:id])
    end

    def initiative_params
      text = %i[title short_description long_description latitude longitude]
      number = %i[finished_at general_sum]
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

    def access_granted?
      initiative = Initiative.friendly.find(params[:id])
      redirect_to root_path, error: t('unauthorized.manage.all') unless current_user.initiatives.include? initiative
    end
  end
end
