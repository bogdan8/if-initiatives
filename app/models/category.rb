# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
end
