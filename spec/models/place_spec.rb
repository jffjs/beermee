require 'spec_helper'

describe Place do
  
  before(:each) do
    @attr = { :name => "Joe's Bar",
              :description => "A description.",
              :website => "http://www.joesbar.com",
              :group => "Bar" }
  end

  describe "validations" do
    
    it "should require a name" do
      no_name_place = Place.new(@attr.merge(:name => ""))
      no_name_place.should_not be_valid
    end

    it "should require a unique name" do
      p = Place.create(@attr)
      same_name_place = Place.new(@attr.merge(:name => p.name))
      same_name_place.should_not be_valid
    end

    it "should reject an invalid website" do
      bad_website_place = Place.new(@attr.merge(:website => "123.http://.com"))
      bad_website_place.should_not be_valid
    end

    it "should reject descriptions > 1000 characters" do
      long_desc_place = Place.new(@attr.merge(:description => "a" * 1001))
      long_desc_place.should_not be_valid
    end

    it "should require a group" do
      no_group = Place.new(@attr.merge(:group => ""))
      no_group.should_not be_valid
    end

    it "should reject an invalid group" do
      bad_group = Place.new(@attr.merge(:group => "Boot"))
      bad_group.should_not be_valid
    end
  end 

  describe "address association" do
    
    before(:each) do
      @address = Factory(:address)
      @place = Place.new(@attr.merge(:address => @address))
    end

    it "should have an address attribute" do
      @place.should respond_to(:address)
    end

    it "should have the correct address" do
      @place.address.should == @address
    end
  end

  describe "activity association" do
    
    before(:each) do
      @place = Place.new(@attr)
      @activity = Factory(:activity, :place => @place, :beer => Factory(:beer))
    end

    it "should have an activities attribute" do
      @place.should respond_to :activities
    end
  end

  describe "image association" do
    
    before(:each) do
      @place = Place.new(@attr)
    end

    it "should have an image attribute" do
      @place.should respond_to(:image)
    end
  end
end
