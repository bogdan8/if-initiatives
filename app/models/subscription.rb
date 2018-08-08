# frozen_string_literal: true
# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint(8)        not null, primary key
#  email      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ApplicationRecord
  validates :email, presence: true
end
