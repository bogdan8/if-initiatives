# frozen_string_literal: true

# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  initiative_id :integer
#  category_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Categorization, type: :model do
  describe '#relations' do
    it { should belong_to :initiative }
    it { should belong_to :category }
  end
end
