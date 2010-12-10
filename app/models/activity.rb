# == Schema Information
# Schema version: 20101207024315
#
# Table name: activities
#
#  id            :integer         not null, primary key
#  place_id      :integer
#  beer_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  activity_type :string(255)
#

class Activity < ActiveRecord::Base
  attr_accessible :beer, :beer_id, :place, :place_name
  belongs_to  :beer
  belongs_to  :place
  belongs_to  :user

  validates  :beer,  :presence => true
  validates  :user,  :presence => true

  def place_name
    place.name if place
  end

  def place_name=(name)
    self.place = Place.find_by_name(name) unless name.blank?
  end
end
