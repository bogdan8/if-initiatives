# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id               :integer          not null, primary key
#  payer_id         :integer
#  user_id          :integer
#  initiative_id    :integer
#  amount           :integer
#  description      :string
#  currency         :string
#  internet_banking :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :donation do
    payer_id 1
    user_id 1
    initiative_id 1
    amount 123
    description Faker::Lorem.characters(55)
    currency 'usd'
    internet_banking 'private'
  end
end
