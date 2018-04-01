# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#relations' do
    it { should have_many :categorizations }
    it { should have_many :initiatives }
  end

  describe '#validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :position }
    it { should validate_length_of(:title).is_at_least(2) }
  end
end
