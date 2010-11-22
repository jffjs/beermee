require 'spec_helper'

describe Brewery do

  before(:each) do 
    @attr = { :name       => "Example Brewery",
              :website    => "http://www.beer.com",
              :description => "A great brewery..." }
  end

  describe "validations" do
    
    it "should require a name" do
      no_name_brewery = Brewery.new(@attr.merge(:name => ""))
      no_name_brewery.should_not be_valid
    end

    it "should have a unique name" do
      @brewery = Brewery.create!(@attr)
      dup_brewery = Brewery.new(@attr)
      dup_brewery.should_not be_valid
    end

    it "should reject invalid website url's" do
      bad_url = Brewery.new(@attr.merge(:website => "123.http.com"))
      bad_url.should_not be_valid
    end

    it "should reject if description is too long" do
      too_long_desc = Brewery.new(@attr.merge(:description => "a" * 1001))
      too_long_desc.should_not be_valid
    end
  end

  describe "address association" do
    
    before(:each) do
      @address = Factory(:address)
      @brewery = Brewery.new(@attr.merge(:address => @address))
    end

    it "should have an address attribute" do
      @brewery.should respond_to(:address)
    end

    it "should have the correct address" do
      @brewery.address.should == @address
    end
  end

  describe "image association" do
    
    before(:each) do
      @brewery = Brewery.new(@attr)
    end

    it "should have an image attribute" do
      @brewery.should respond_to(:image)
    end
  end
end
