# == Schema Information
# Schema version: 20101116221815
#
# Table name: breweries
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  info               :text
#  website            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :string(255)
#  image_updated_at   :datetime
#

class Brewery < ActiveRecord::Base
  
  attr_accessible :name, :info, :website, :image, :address_attributes

  has_many  :beers
  has_one   :address
  accepts_nested_attributes_for :address

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "60x80#" }

  validates :name,        :presence => true, :uniqueness => true
  validates :info,        :length   => { :maximum => 1000 }
  validates :website,     :format   => { :with => /^(#{URI::regexp(%w(http https))})$/,
                                       :allow_blank => true }
  
end
