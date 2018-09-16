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
    attachments.find(&:image?) ? attachments.find(&:image?).image.url(size) : '/images/missing.png'
  end

  def attachments_videos
    attachments.select(&:video?)
  end

  def first_videos
    attachments.find(&:video?) ? attachments.find(&:video?).video.url(size) : '/video/default.avi'
  end
end
