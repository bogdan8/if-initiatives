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

FactoryBot.define do
  factory :contact do
    full_name Faker::SiliconValley.character
    email Faker::Internet.email
    description Faker::SiliconValley.quote
  end
end
