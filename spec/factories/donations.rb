# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id            :bigint(8)        not null, primary key
#  user_id       :bigint(8)
#  initiative_id :bigint(8)
#  amount        :integer
#  description   :string
#  currency      :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :donation do
    payer_id { 1 }
    user_id { 1 }
    initiative_id { 1 }
    amount { 123 }
    description { Faker::Lorem.characters(55) }
    currency { 'usd' }
    status { 'success' }
  end
end
