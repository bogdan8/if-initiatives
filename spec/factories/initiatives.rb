# == Schema Information
#
# Table name: initiatives
#
#  id                :integer          not null, primary key
#  title             :string
#  slug              :string
#  short_description :text
#  long_description  :text
#  sum               :integer
#  finished_date     :date
#  collected_amount  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :initiative do
    title "MyString"
    slug "MyString"
    short_description "MyText"
    long_description "MyText"
    sum 1
    finished_date "2018-03-25"
    collected_amount 1
  end
end
