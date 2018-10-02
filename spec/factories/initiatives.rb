# frozen_string_literal: true

# == Schema Information
#
# Table name: initiatives
#
#  id                :bigint(8)        not null, primary key
#  title             :string
#  short_description :text
#  long_description  :text
#  general_sum       :integer
#  collected_amount  :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint(8)
#  state             :string           default("draft")
#  slug              :string
#  finished_at       :datetime
#  longitude         :string
#  latitude          :string
#

FactoryBot.define do
  factory :initiative do
    title { Faker::Lorem.characters(10) }
    short_description { Faker::Lorem.characters(26) }
    long_description { Faker::Lorem.characters(55) }
    general_sum { 123 }
    finished_at { Time.current }
    collected_amount { 123 }
  end
end
