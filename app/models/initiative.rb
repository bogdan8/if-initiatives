# frozen_string_literal: true

# == Schema Information
#
# Table name: initiatives
#
#  id                :integer          not null, primary key
#  title             :string
#  slug              :string
#  short_description :text
#  long_description  :text
#  general_sum       :integer
#  finished_date     :date
#  collected_amount  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  state             :string
#

class Initiative < ApplicationRecord
  state_machine initial: :draft do
    event :to_confirmating do
      transition %i[draft rejected] => :confirmating
    end

    event :to_fundraising do
      transition confirmating: :fundraising
    end

    event :to_rejected do
      transition %i[confirmating fundraising] => :rejected
    end

    event :to_fundraised do
      transition fundraising: :fundraised
    end

    event :to_implementing do
      transition fundraised: :implementing
    end

    event :to_reporting do
      transition implementing: :reporting
    end

    event :to_implemented do
      transition reporting: :implemented
    end

    event :to_unimplemented do
      transition %i[fundraised reporting] => :unimplemented
    end

    event :to_locked do
      transition all - %i[locked] => :locked
    end
  end

  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :comments, dependent: :destroy

  # validations
  validates :title, :short_description, :long_description, :general_sum, :finished_date, presence: true
  validates :title, length: { minimum: 5 }
  validates :short_description, length: { minimum: 25 }
  validates :long_description, length: { minimum: 50 }
  validates :general_sum, length: { maximum: 6 }
end
