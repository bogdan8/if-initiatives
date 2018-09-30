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

require 'rails_helper'

RSpec.describe Initiative, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :categories }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :reports }
    it { is_expected.to have_many :attachments }
    it { is_expected.to have_many :steps }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :short_description }
    it { is_expected.to validate_presence_of :long_description }
    it { is_expected.to validate_presence_of :general_sum }
    it { is_expected.to validate_presence_of :finished_at }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:short_description).is_at_least(25) }
    it { is_expected.to validate_length_of(:long_description).is_at_least(50) }
    # it { is_expected.to validate_length_of(:general_sum).is_equal_to(6) }
  end
end
