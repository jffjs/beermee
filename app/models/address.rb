# == Schema Information
# Schema version: 20101121221645
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  street           :string(255)
#  city             :string(255)
#  state_id         :integer
#  country_id       :integer
#  postal_code      :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  addressable_id   :integer
#  addressable_type :string(255)
#

class Address < ActiveRecord::Base
  belongs_to  :state
  belongs_to  :country
  belongs_to  :addressable, :polymorphic => true
end
