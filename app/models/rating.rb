# == Schema Information
# Schema version: 20101210013325
#
# Table name: ratings
#
#  id         :integer         not null, primary key
#  beer_id    :integer
#  user_id    :integer
#  score      :decimal(, )
#  notes      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
end
