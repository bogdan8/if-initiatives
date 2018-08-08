# frozen_string_literal: true
# == Schema Information
#
# Table name: attachments
#
#  id                 :bigint(8)        not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  video_file_name    :string
#  video_content_type :string
#  video_file_size    :integer
#  video_updated_at   :datetime
#  initiative_id      :bigint(8)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  report_id          :bigint(8)
#

class Attachment < ApplicationRecord
  belongs_to :initiative, optional: true
  belongs_to :report, optional: true

  size_initiative_images = { medium: '300x300>', thumb: '100x100>' }
  path_initiative_images = ':rails_root/public/images/:class/:attachment/:id/:style/:filename'

  has_attached_file :image,
                    styles: size_initiative_images,
                    path: path_initiative_images,
                    url: '/images/:class/:attachment/:id/:style/:filename',
                    default_url: '/images/missing.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  has_attached_file :video, url: '/videos/:class/:attachment/:id/:style/:filename'
end
