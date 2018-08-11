# frozen_string_literal: true
# == Schema Information
#
# Table name: donations
#
#  id            :bigint(8)        not null, primary key
#  user_id       :bigint(8)
#  initiative_id :bigint(8)
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
    Admin.all.each do |admin|
      Notification.create do |notification|
        notification.notify_type = 'donation'
        notification.actor = user
        # TODO: fix admin
        #notification.user = admin
        notification.target = self
      end
    end
  end
end
