# frozen_string_literal: true
# == Schema Information
#
# Table name: contacts
#
#  id          :bigint(8)        not null, primary key
#  full_name   :string
#  email       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Contact < ApplicationRecord
  after_commit :create_notifications, on: :create

  validates :full_name, :email, :description, presence: true

  private

  def create_notifications
    Admin.all.each do |admin|
      Notification.create do |notification|
        notification.notify_type = 'contact'
        notification.user = admin
        notification.target = self
      end
    end
  end
end
