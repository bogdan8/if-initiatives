# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :category do
    title Faker::Lorem.characters(10)
    slug Faker::Lorem.characters(10)
    position 1
  end
end
