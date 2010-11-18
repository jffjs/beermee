# == Schema Information
# Schema version: 20101116221815
#
# Table name: styles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Style < ActiveRecord::Base
  has_many :beers
end
