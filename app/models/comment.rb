# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  title         :string           default("")
#  text          :text             default("")
#  initiative_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :initiative

  validates :title, presence: true
  validates :title, length: { minimum: 5 }
  validates :text, length: { minimum: 10 }
  validates :text, presence: true
end
