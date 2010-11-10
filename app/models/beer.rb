# == Schema Information
# Schema version: 20101106204629
#
# Table name: beers
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  brewery_id       :integer
#  description      :text
#  abv              :decimal(, )
#  ibu              :decimal(, )
#  original_gravity :decimal(, )
#  style_id         :integer
#  website          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Beer < ActiveRecord::Base
  attr_accessible :name, :brewery_id, :style_id, :description, :abv, :ibu, :website,
                  :image

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "60x80#" }
  belongs_to :brewery
  belongs_to :style

  validates :name,        :presence => true,
                          :length => { :maximum => 50 } 
  validates :description, :length => { :maximum => 500 }
  validates :abv,         :numericality => { :greater_than_or_equal_to => 0,
                                             :less_than_or_equal_to    => 100,
                                             :allow_nil => true }
  validates :ibu,         :numericality => { :greater_than_or_equal_to => 0,
                                             :less_than_or_equal_to    => 200,
                                             :allow_nil => true }
  validates :brewery_id,  :presence => true
  validates :style_id,    :presence => true
  validates :website,     :format => { :with => /^(#{URI::regexp(%w(http https))})$/,
                                       :allow_blank => true }


end
