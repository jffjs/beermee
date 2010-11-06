require 'spec_helper'

describe Country do

  before(:each) do
    @attr = { :name => "A Country",
              :iso  => "AC",
              :iso3 => "ACY",
              :numcode => 50 }
  end

  describe "brewery associations" do
    
    before(:each) do
      @country = Country.create!(@attr)
      state = Factory(:state)
      @brewery1 = Factory(:brewery, :state => state, :country => @country)
      @brewery2 = Factory(:brewery, :state => state, :country => @country, :name => "Brewery2")
    end

    it "should have a breweries attribute" do
      @country.should respond_to(:breweries)
    end
  end
end
