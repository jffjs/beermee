# == Schema Information
# Schema version: 20100926205747
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  iso        :string(255)
#  name       :string(255)
#  iso3       :string(255)
#  numcode    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base
  has_many :addresses
  has_many :breweries, :through => :addresses

  validates :name,  :uniqueness => true
end
