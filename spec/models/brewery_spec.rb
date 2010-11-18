require 'spec_helper'

describe Brewery do

  before(:each) do 
    @attr = { :name       => "Example Brewery",
              :website    => "http://www.beer.com",
              :info       => "A great brewery..." }
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

    it "should reject if info is too long" do
      too_long_info = Brewery.new(@attr.merge(:info => "a" * 501))
      too_long_info.should_not be_valid
    end
  end

  describe "address association" do
    
    before(:each) do
      @brewery = Brewery.new(@attr)
      @address = Factory(:address, :brewery => @brewery)
    end

    it "should have an address attribute" do
      @brewery.should respond_to(:address)
    end

    it "should have the correct address" do
      @brewery.address.should == @address
    end
  end
end
