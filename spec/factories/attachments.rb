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

FactoryBot.define do
  factory :attachment do
    image { File.open('spec/support/photo.jpg') }
  end
end
