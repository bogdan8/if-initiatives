# frozen_string_literal: true
# == Schema Information
#
# Table name: categorizations
#
#  id            :bigint(8)        not null, primary key
#  initiative_id :integer
#  category_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Categorization, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to :initiative }
    it { is_expected.to belong_to :category }
  end
end
