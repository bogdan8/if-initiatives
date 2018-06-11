# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id            :integer          not null, primary key
#  payer_id      :integer
#  user_id       :integer
#  initiative_id :integer
#  amount        :integer
#  description   :string
#  currency      :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Donation < ApplicationRecord
  after_commit :create_notifications, on: :create
  
  belongs_to :user
  belongs_to :initiative

  private

  def create_notifications
    User.with_role(:administrator).each do |admin|
      Notification.create do |notification|
        notification.notify_type = 'donation'
        notification.actor = user
        notification.user = admin
        notification.target = self
      end
    end
  end
end
