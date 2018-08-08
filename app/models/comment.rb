# frozen_string_literal: true
# == Schema Information
#
# Table name: comments
#
#  id            :bigint(8)        not null, primary key
#  title         :string           default("")
#  text          :text             default("")
#  initiative_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ApplicationRecord
  after_commit :create_notifications, on: :create

  belongs_to :user
  belongs_to :initiative

  validates :title, presence: true
  validates :text, presence: true
  validates :title, length: { minimum: 5 }
  validates :text, length: { minimum: 5 }

  private

  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'comment'
      notification.actor = user
      notification.user = initiative.user
      notification.target = self
      notification.second_target = initiative
    end
  end
end
