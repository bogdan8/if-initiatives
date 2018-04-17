# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  initiative_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :initiative

  has_many :attachments, dependent: :destroy, inverse_of: :report
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  # validations
  validates :title, :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 25 }
end
