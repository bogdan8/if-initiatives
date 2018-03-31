# frozen_string_literal: true

class InitiativesController < ApplicationController
  load_and_authorize_resource
  before_action :all_categories, only: %i[new create edit update]

  def index; end

  def show; end

  def new
    @initiative = current_user.initiatives.build
  end

  def create
    @initiative = current_user.initiatives.new(initiative_params)
    add_categories_to_initiative

    if @initiative.save
      redirect_to @initiative, success: 'Initiative created'
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    Categorization.where(initiative_id: @initiative.id).delete_all
    add_categories_to_initiative

    if @initiative.update(initiative_params)
      redirect_to @initiative, success: 'Initiative updated'
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @initiative.destroy
      redirect_to initiatives_path, success: 'Initiative deleted'
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  private

  def initiative_params
    text = %i[title short_description long_description]
    number = %i[finished_date general_sum]
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
