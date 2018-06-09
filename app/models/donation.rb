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

class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :initiative
end
