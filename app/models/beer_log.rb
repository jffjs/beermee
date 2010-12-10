# == Schema Information
# Schema version: 20101205015617
#
# Table name: beer_logs
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class BeerLog < ActiveRecord::Base
  belongs_to :user
  has_many :activities, :as => :trackable
end
