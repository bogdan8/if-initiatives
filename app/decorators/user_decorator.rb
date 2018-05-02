# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def roles_name
    roles.map(&:name).join(',')
  end
end
