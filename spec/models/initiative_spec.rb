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

require 'rails_helper'

RSpec.describe Initiative, type: :model do
  describe '#relations' do
    it { should belong_to :user }
    it { should have_many :categories }
    it { should have_many :comments }
  end

  describe '#validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :short_description }
    it { should validate_presence_of :long_description }
    it { should validate_presence_of :general_sum }
    it { should validate_presence_of :finished_date }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:short_description).is_at_least(25) }
    it { should validate_length_of(:long_description).is_at_least(50) }
    it { should validate_length_of(:general_sum).is_at_most(6) }
  end
end
