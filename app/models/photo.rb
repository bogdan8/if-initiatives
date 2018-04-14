# frozen_string_literal: true

# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  initiative_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Photo < ApplicationRecord
  belongs_to :initiative

  size_initiative_images = { medium: '300x300>', thumb: '100x100>' }
  path_initiative_images = ':rails_root/public/images/:class/:attachment/:id/:style/:filename'

  has_attached_file :photos,
                    styles: size_initiative_images,
                    path: path_initiative_images,
                    url: '/images/:class/:attachment/:id/:style/:filename',
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photos, content_type: %r{\Aimage\/.*\Z}
end
