# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default("")
#  phone                  :string           default("")
#  age                    :integer
#  provider               :string           default("")
#  uid                    :string           default("")
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#relations' do
    it { should have_many :initiatives }
    it { should have_many :comments }
  end

  describe '#validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :age }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
  end
end
