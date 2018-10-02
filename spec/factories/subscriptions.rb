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

FactoryBot.define do
  factory :subscription do
    email { Faker::Internet.email }
  end
end
