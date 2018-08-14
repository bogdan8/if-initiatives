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

FactoryBot.define do
  factory :report do
    title Faker::Lorem.characters(10)
    description Faker::Lorem.characters(26)
  end
end
