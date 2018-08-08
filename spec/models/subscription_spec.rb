# frozen_string_literal: true
# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint(8)        not null, primary key
#  email      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { is_expected.to validate_presence_of :email }
end
