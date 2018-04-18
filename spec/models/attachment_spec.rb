# frozen_string_literal: true

# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  video_file_name    :string
#  video_content_type :string
#  video_file_size    :integer
#  video_updated_at   :datetime
#  initiative_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  report_id          :integer
#

require 'rails_helper'

RSpec.describe Attachment, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to :initiative }
    it { is_expected.to belong_to :report }
  end
end
