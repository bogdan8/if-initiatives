# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  title         :string           default("")
#  text          :text             default("")
#  initiative_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#relations' do
    it { should belong_to :user }
    it { should belong_to :initiative }
  end

  describe '#validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:text).is_at_least(10) }
  end
end
