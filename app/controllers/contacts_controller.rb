# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    add_breadcrumb t('.breadcrumb.title')
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, success: t('.success')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :description)
  end
end
