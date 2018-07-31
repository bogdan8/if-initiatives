# frozen_string_literal: true

class ContactsController < ApplicationController
  load_resource
  def new
    add_breadcrumb t('.breadcrumb.title')
  end

  def create
    if @contact.save
      redirect_to root_path, success: t('.success')
    else
      flash[:error] = @contact.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :description)
  end
end
