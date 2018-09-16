# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id            :bigint(8)        not null, primary key
#  user_id       :bigint(8)
#  initiative_id :bigint(8)
#  amount        :integer
#  description   :string
#  currency      :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to :initiative }
    it { is_expected.to belong_to :user }
  end
end
