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
#

class Initiative < ApplicationRecord
end
