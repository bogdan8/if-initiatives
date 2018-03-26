# == Schema Information
#
# Table name: initiatives
#
#  id                :integer          not null, primary key
#  title             :string
#  slug              :string
#  short_description :text
#  long_description  :text
#  sum               :integer
#  finished_date     :date
#  collected_amount  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  category_id       :integer
#

require 'rails_helper'

RSpec.describe Initiative, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
