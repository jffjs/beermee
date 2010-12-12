# == Schema Information
# Schema version: 20101116221815
#
# Table name: beers
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  brewery_id         :integer
#  description        :text
#  abv                :decimal(, )
#  ibu                :decimal(, )
#  original_gravity   :decimal(, )
#  style_id           :integer
#  website            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Beer < ActiveRecord::Base
  attr_accessible :name, :style_id, :description, :abv, :ibu, :website,
                  :image, :brewery_name

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "60x80#",
                                 :small => "30x40#" }
  belongs_to :brewery
  belongs_to :style
  has_many  :activities, :order => "created_at DESC"
  has_many  :ratings

  validates :name,        :presence => true,
                          :length => { :maximum => 50 } 
  validates :description, :length => { :maximum => 1000 }
  validates :abv,         :numericality => { :greater_than_or_equal_to => 0,
                                             :less_than_or_equal_to    => 100,
                                             :allow_nil => true }
  validates :ibu,         :numericality => { :greater_than_or_equal_to => 0,
                                             :less_than_or_equal_to    => 200,
                                             :allow_nil => true }
  validates :style_id,    :presence => true
  validates :website,     :format => { :with => /^(#{URI::regexp(%w(http https))})$/,
                                       :allow_blank => true }


  def average_rating
    value = 0
    total = 0
    ratings.each do |rating| 
      unless rating.new_record?
        value += rating.score 
        total += 1
      end
    end
    value.to_f / total.to_f
  end

# Virtual attributes
  def brewery_name
    brewery.name if brewery
  end

  def brewery_name=(name)
    self.brewery = Brewery.find_by_name(name) unless name.blank?
  end
end
