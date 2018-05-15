# frozen_string_literal: true

class ContactsController < ApplicationController
  load_resource
  def new; end

  def create
    if @contact.save
      redirect_to root_path, success: t('controller.contact.save')
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
