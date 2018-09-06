# frozen_string_literal: true

# == Schema Information
#
# Table name: initiatives
#
#  id                :bigint(8)        not null, primary key
#  title             :string
#  short_description :text
#  long_description  :text
#  general_sum       :integer
#  finish_date       :datetime
#  collected_amount  :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint(8)
#  state             :string           default("draft")
#  slug              :string
#  finished_at       :datetime
#

class Initiative < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged]
  after_commit :create_notifications, on: :create

  include Initiatives::StateMachine

  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :donations, dependent: :destroy

  has_many :attachments, dependent: :destroy, inverse_of: :initiative
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :title, :short_description, :long_description, :general_sum, :finished_at, presence: true
  validates :title, length: { minimum: 5 }
  validates :short_description, length: { minimum: 25 }
  validates :long_description, length: { minimum: 50 }
  validates :general_sum, length: { maximum: 6 }

  scope :fundraising_now, -> { where(finish_date: Time.current.to_date, state: 'fundraising') }
  scope :without_draft, -> { where.not(state: :draft) }
  scope :available_everyone, ->(*states) { where.not(state: states) }
  scope :by_category, ->(id) { joins(:categorizations).where(Categorization.table_name => { category_id: id }) }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :ukrainian).to_s
  end

  def update_amount(amount)
    new_amount = collected_amount + amount.to_i
    update(collected_amount: new_amount)
  end

  private

  def create_notifications
    Admin.find_each do |admin|
      Notification.create do |notification|
        notification.notify_type = 'initiative'
        notification.actor = user
        notification.admin = admin
        notification.target = self
      end
    end
  end
end
