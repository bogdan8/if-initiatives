# frozen_string_literal: true

# == Schema Information
#
# Table name: initiatives
#
#  id                :integer          not null, primary key
#  title             :string
#  short_description :text
#  long_description  :text
#  general_sum       :integer
#  finish_date       :date
#  collected_amount  :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  state             :string           default("draft")
#  finish_days       :integer          default(5)
#  slug              :string
#

class Initiative < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged]
  after_commit :create_notifications, on: :create

  include Initiatives::StateMachine

  # relations
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :donations, dependent: :destroy

  has_many :attachments, dependent: :destroy, inverse_of: :initiative
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  # validations
  validates :title, :short_description, :long_description, :general_sum, :finish_days, presence: true
  validates :title, length: { minimum: 5 }
  validates :short_description, length: { minimum: 25 }
  validates :long_description, length: { minimum: 50 }
  validates :general_sum, length: { maximum: 6 }

  # get initiatives where status is fundraising and if date equal Time.now
  def self.fundraising_now
    where(finish_date: Time.current.to_date, state: 'fundraising')
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :ukrainian).to_s
  end

  def self.without_draft
    where.not(state: :draft)
  end

  def update_amount(amount)
    new_amount = collected_amount + amount.to_i
    update(collected_amount: new_amount)
  end

  # method for get initiatives which available for everyone
  def self.available_everyone(*states)
    where.not(state: states)
  end

  # method for get category through Categorization
  def self.by_category(id)
    joins(:categorizations).where(Categorization.table_name => { category_id: id })
  end

  private

  def create_notifications
    User.with_role(:administrator).each do |admin|
      Notification.create do |notification|
        notification.notify_type = 'initiative'
        notification.actor = user
        notification.user = admin
        notification.target = self
      end
    end
  end
end
