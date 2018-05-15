# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  full_name   :string
#  email       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Contact < ApplicationRecord
  validates :full_name, :email, :description, presence: true
end
