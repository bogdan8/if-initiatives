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
#  finish_date       :date
#  collected_amount  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  state             :string           default("draft")
#  finish_days       :integer          default(5)
#

require 'rails_helper'

RSpec.describe Initiative, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :categories }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :reports }
    it { is_expected.to have_many :attachments }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :short_description }
    it { is_expected.to validate_presence_of :long_description }
    it { is_expected.to validate_presence_of :general_sum }
    it { is_expected.to validate_presence_of :finish_days }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:short_description).is_at_least(25) }
    it { is_expected.to validate_length_of(:long_description).is_at_least(50) }
    # it { is_expected.to validate_length_of(:general_sum).is_equal_to(6) }
  end
end
