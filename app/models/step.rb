# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id            :integer          not null, primary key
#  state         :string
#  initiative_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Step < ApplicationRecord
  belongs_to :initiative
end
