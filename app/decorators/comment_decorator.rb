# frozen_string_literal: true

class CommentDecorator < ApplicationDecorator
  delegate_all

  def user_avatar
    user.avatar.url(:medium) unless user.avatar.nil?
  end
end
