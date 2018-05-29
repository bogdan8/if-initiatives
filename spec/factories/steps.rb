# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :integer          not null, primary key
#  state         :string
#  initiative_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :step do
    initiative_id 1
    state Faker::Lorem.characters(10)
  end
end
