# frozen_string_literal: true

# == Schema Information
#
# Table name: initiatives
#
#  id                :integer          not null, primary key
#  title             :string
#  slug              :string
#  short_description :text
#  long_description  :text
#  general_sum       :integer
#  finished_date     :date
#  collected_amount  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#

FactoryBot.define do
  factory :initiative do
    title Faker::Lorem.characters(10)
    short_description Faker::Lorem.characters(26)
    long_description Faker::Lorem.characters(55)
    general_sum 123
    finished_date Faker::Date.backward
    collected_amount 123
  end
end
