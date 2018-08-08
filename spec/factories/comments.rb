# frozen_string_literal: true
# == Schema Information
#
# Table name: comments
#
#  id            :bigint(8)        not null, primary key
#  title         :string           default("")
#  text          :text             default("")
#  initiative_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :comment do
    title Faker::Lorem.characters(15)
    text Faker::Lorem.characters(20)
  end
end
