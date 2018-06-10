# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id            :integer          not null, primary key
#  payer_id      :integer
#  user_id       :integer
#  initiative_id :integer
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
