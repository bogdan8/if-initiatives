# frozen_string_literal: true
# == Schema Information
#
# Table name: contacts
#
#  id          :bigint(8)        not null, primary key
#  full_name   :string
#  email       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe '#validations' do
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :description }
  end
end
