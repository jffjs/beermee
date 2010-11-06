require 'spec_helper'

describe State do

  before(:each) do
    @attr = { :name => "A State",
              :abbreviation => "AS" }
  end

  describe "brewery associations" do
    
    before(:each) do
      @state = State.create!(@attr)
      country = Factory(:country)
      @brewery1 = Factory(:brewery, :state => @state, :country => country)
      @brewery2 = Factory(:brewery, :state => @state, :country => country, :name => "Brewery2")
    end

    it "should have a breweries attribute" do
      @state.should respond_to(:breweries)
    end
  end
end
