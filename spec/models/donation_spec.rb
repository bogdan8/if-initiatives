# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id               :integer          not null, primary key
#  payer_id         :integer
#  user_id          :integer
#  initiative_id    :integer
#  amount           :integer
#  description      :string
#  currency         :string
#  internet_banking :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Donation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
