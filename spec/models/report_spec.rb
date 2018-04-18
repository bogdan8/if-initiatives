# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  initiative_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


require 'rails_helper'

RSpec.describe Report, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to :initiative }
    it { is_expected.to have_many :attachments }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:description).is_at_least(25) }
  end
end
