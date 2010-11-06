# == Schema Information
# Schema version: 20100925181345
#
# Table name: styles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  aroma      :text
#  appearance :string(255)
#  flavor     :text
#  mouthfeel  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Style < ActiveRecord::Base
  has_many :beers
end
