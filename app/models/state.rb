# == Schema Information
# Schema version: 20100925161446
#
# Table name: states
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class State < ActiveRecord::Base
  has_many :addresses

  validates :name,  :uniqueness => true
end

