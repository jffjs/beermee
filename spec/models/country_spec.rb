require 'spec_helper'

describe Country do

  before(:each) do
    @attr = { :name => "A Country",
              :iso  => "AC",
              :iso3 => "ACY",
              :numcode => 50 }
  end

  describe "address associations" do
    
    before(:each) do
      @country = Country.create!(@attr)
      @a1 = Factory(:address, :country => @country, :brewery => nil, :state => nil)
      @a2 = Factory(:address, :country => @country, :brewery => nil, :state => nil)
    end

    it "should have a addresses attribute" do
      @country.should respond_to(:addresses)
    end

    it "should have the correct number of addresses" do
      @country.addresses.length.should == 2
    end
  end

  describe "breweries association" do
    
    before(:each) do
      @country= Country.create!(@attr)
      @b1 = Factory(:brewery)
      @b2 = Factory(:brewery, :name => "Another")
      @a1 = Factory(:address, :state => nil, :brewery => @b1, :country => @country)
      @a2 = Factory(:address, :state => nil, :brewery => @b2, :country => @country)
    end

    it "should have a breweries attribute" do
      @country.should respond_to(:breweries)
    end

    it "should have the right number of breweries" do
      @country.breweries.length.should == 2
    end
  end

  describe "validationes" do

    it "should reject a country with duplicate name" do
      @country = Country.create!(@attr)
      dup_country = Country.new(@attr)
      dup_country.should_not be_valid
    end
  end
end
