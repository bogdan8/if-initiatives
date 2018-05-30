# frozen_string_literal: true

class CommentDecorator < ApplicationDecorator
  delegate_all

  def user_avatar
    !user.avatar.nil? ? user.avatar.url(:medium) : 'missing.png'
  end
end
