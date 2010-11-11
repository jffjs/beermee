# == Schema Information
# Schema version: 20101014002734
#
# Table name: breweries
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  city       :string(255)
#  country_id :integer(255)
#  state_id   :integer(255)
#  zipcode    :string(255)
#  info       :text
#  created_at :datetime
#  updated_at :datetime
#  address    :string(255)
#  website    :string(255)
#

class Brewery < ActiveRecord::Base
  
  USA_ID = 214

  attr_accessible :name, :city, :country_id, :state_id, :address, :zipcode, 
                  :info, :website, :image

  has_many    :beers
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "60x80#" }

  belongs_to  :country
  belongs_to  :state

  validates :name,        :presence   => true,
                          :uniqueness => true
  validates :city,        :length => { :maximum => 50 }
  validates :info,        :length => { :maximum => 500 }
  validates :address,     :length => { :maximum => 80 }
  validates :zipcode,     :length => { :maximum => 10 }
  validates :website,     :format => { :with => /^(#{URI::regexp(%w(http https))})$/,
                                       :allow_blank => true }
  
  def in_us?
    self.country == Country.find_by_iso("US") unless country.nil?
  end

end
