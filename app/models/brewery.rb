# == Schema Information
# Schema version: 20101130052456
#
# Table name: breweries
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  description        :text
#  website            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :string(255)
#  image_updated_at   :datetime
#

class Brewery < ActiveRecord::Base
  has_many  :beers
  has_many  :activities, :through => :beers, :order => "created_at DESC"
  has_one   :address, :as => :addressable
  accepts_nested_attributes_for :address

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "60x80#" }

  validates :name,        :presence => true, :uniqueness => true
  validates :description, :length   => { :maximum => 1000 }
  validates :website,     :format   => { :with => /^(#{URI::regexp(%w(http https))})$/,
                                         :allow_blank => true }
    
end
