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
    event :submit_for_confirmation do
      transition %i[draft rejected] => :pending_approval
    end

    event :success_confirmation do
      transition pending_approval: :fundraiser
    end

    event :error_confirmation do
      transition %i[pending_approval draft fundraiser] => :rejected
    end

    event :finish_fundraising do
      transition fundraiser: :fundraising_finished
    end

    event :started_implement do
      transition fundraising_finished: :being_implemented
    end

    event :insufficient_funds do
      transition fundraising_finished: :unrealized
    end

    event :check_implemented do
      transition being_implemented: :audit_implemented
    end

    event :finish_fundraiser_success do
      transition audit_implemented: :implemented
    end

    event :finish_fundraiser_errors do
      transition audit_implemented: :unrealized
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
