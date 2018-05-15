# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  full_name   :string
#  email       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :contact do
    full_name Faker::Lorem.characters(10)
    email Faker::Internet.email
    description Faker::Lorem.characters(55)
  end
end
