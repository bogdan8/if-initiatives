# frozen_string_literal: true

class InitiativeDecorator < ApplicationDecorator
  delegate_all

  def categories_title
    categories.map(&:title).join(',')
  end

  def attachments_images
    attachments.select(&:image?)
  end

  def attachments_videos
    attachments.select(&:video?)
  end
end
