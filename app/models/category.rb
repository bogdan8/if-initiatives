# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :initiatives, through: :categorizations

  validates :title, presence: true
  validates :title, length: { minimum: 2 }
  validates :position, presence: true
end
