# == Schema Information
# Schema version: 20101116221815
#
# Table name: addresses
#
#  id          :integer         not null, primary key
#  street      :string(255)
#  city        :string(255)
#  state_id    :integer
#  country_id  :integer
#  postal_code :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Address < ActiveRecord::Base
  belongs_to  :state
  belongs_to  :country
  belongs_to  :brewery
end
