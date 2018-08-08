# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#relations' do
    it { is_expected.to have_many :categorizations }
    it { is_expected.to have_many :initiatives }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :position }
    it { is_expected.to validate_length_of(:title).is_at_least(2) }
  end
end
