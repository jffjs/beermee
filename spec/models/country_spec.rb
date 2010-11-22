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
      @a1 = Factory(:address, :country => @country, :state => nil)
      @a2 = Factory(:address, :country => @country, :state => nil)
    end

    it "should have a addresses attribute" do
      @country.should respond_to(:addresses)
    end

    it "should have the correct number of addresses" do
      @country.addresses.length.should == 2
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
