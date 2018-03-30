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
  pending "add some examples to (or delete) #{__FILE__}"
end
