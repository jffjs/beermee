require 'spec_helper'

describe Brewery do

  before(:each) do 
    @state = Factory(:state)
    @country = Factory(:country)
    @attr = { :name       => "Example Brewery",
              :address    => "123 Sample Dr.",
              :city       => "Beerville",
              :country_id => @country.id,
              :state_id   => @state.id,
              :zipcode    => "12345",
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

    it "should require a country" do
      no_country_brewery = Brewery.new(@attr.merge(:country_id => nil))
      no_country_brewery.should_not be_valid
    end

    it "should require state if in US" do
      no_state_brewery = Brewery.new(@attr.merge(:state_id => nil, :country_id => 214))
      no_state_brewery.should_not be_valid
    end

    it "should not require state if outside US" do
      @not_us = Factory(:country, :iso => "CA", :name => "Canada", :iso3 => "CAN")
      outside_us = Brewery.new(@attr.merge(:country_id => 23, :state => nil))
      outside_us.should be_valid
    end

    it "should require a city" do
      no_city_brewery = Brewery.new(@attr.merge(:city => ""))
      no_city_brewery.should_not be_valid
    end

    it "should reject if info is too long" do
      too_long_info = Brewery.new(@attr.merge(:info => "a" * 501))
      too_long_info.should_not be_valid
    end

    it "should reject if address is too long" do
      too_long_address = Brewery.new(@attr.merge(:address => "a" * 81))
      too_long_address.should_not be_valid
    end

    it "should reject if zipcode is too long" do
      too_long_zip = Brewery.new(@attr.merge(:zipcode => "1" * 11))
      too_long_zip.should_not be_valid
    end
  end

  describe "state assocation" do
    
    before(:each) do
      @brewery = @state.breweries.create(@attr)
    end

    it "should have a state attribute" do
      @brewery.should respond_to(:state)
    end

    it "should reference the correct state" do
      @brewery.state_id.should == @state.id
      @brewery.state.should == @state
    end
  end

  describe "country association" do

    before(:each) do
      @brewery = @country.breweries.create(@attr)
    end

    it "should have a country attribute" do
      @brewery.should respond_to(:country)
    end

    it "should reference the correct country" do
      @brewery.country_id.should == @country.id
      @brewery.country.should == @country
    end
  end
end
