require 'spec_helper'

describe State do

  before(:each) do
    @attr = { :name => "A State",
              :abbreviation => "AS" }
  end

  describe "addresses association" do
    
    before(:each) do
      @state = State.create!(@attr)
      @a1 = Factory(:address, :state => @state, :brewery => nil, :country => nil)
      @a2 = Factory(:address, :state => @state, :brewery => nil, :country => nil)
    end

    it "should have a addresses attribute" do
      @state.should respond_to(:addresses)
    end

    it "should have the right number of addresses" do
      @state.addresses.length.should == 2
    end
  end

  describe "breweries association" do
    
    before(:each) do
      @state = State.create!(@attr)
      @b1 = Factory(:brewery)
      @b2 = Factory(:brewery, :name => "Another")
      @a1 = Factory(:address, :state => @state, :brewery => @b1, :country => nil)
      @a2 = Factory(:address, :state => @state, :brewery => @b2, :country => nil)
    end

    it "should have a breweries attribute" do
      @state.should respond_to(:breweries)
    end

    it "should have the right number of breweries" do
      @state.breweries.length.should == 2
    end
  end

  describe "validations" do
  
    it "should reject a state with duplicate name" do
      @state = State.create!(@attr)
      dup_state = State.new(@attr)
      dup_state.should_not be_valid
    end
  end
end
