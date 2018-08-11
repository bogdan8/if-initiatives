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

class Categorization < ApplicationRecord
  belongs_to :initiative
  belongs_to :category
end
