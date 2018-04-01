# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  title         :string           default("")
#  text          :text             default("")
#  initiative_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :comment do
    title 'MyString'
    text 'MyText'
    initiative nil
  end
end
