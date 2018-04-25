# frozen_string_literal: true

# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  email      :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { is_expected.to validate_presence_of :email }
end
