# frozen_string_literal: true
# == Schema Information
#
# Table name: steps
#
#  id            :bigint(8)        not null, primary key
#  state         :string
#  initiative_id :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Step < ApplicationRecord
  belongs_to :initiative
end
