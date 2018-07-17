# frozen_string_literal: true

class InitiativeDecorator < ApplicationDecorator
  delegate_all

  def categories_title
    categories.map(&:title).join(',')
  end

  def attachments_images
    attachments.select(&:image?)
  end

  def first_image(size)
    attachments.select(&:image?).first ? attachments.select(&:image?).first.image.url(size) : '/images/missing.png'
  end

  def attachments_videos
    attachments.select(&:video?)
  end

  def first_videos
    attachments.select(&:video?).first ? attachments.select(&:video?).first.video.url(size) : '/video/default.avi'
  end
end
