# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id            :bigint(8)        not null, primary key
#  title         :string
#  description   :text
#  initiative_id :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Report < ApplicationRecord
  after_commit :create_notifications, on: :create
  belongs_to :initiative

  has_many :attachments, dependent: :destroy, inverse_of: :report
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :title, :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 25 }

  private

  def create_notifications
    Admin.find_each do |admin|
      Notification.create do |notification|
        notification.notify_type = 'report'
        notification.actor = initiative.user
        # TODO: fix admin
        notification.user = admin
        notification.target = self
        notification.second_target = initiative
      end
    end
  end
end
