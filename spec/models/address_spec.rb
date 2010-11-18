require 'spec_helper'

describe Address do

  before(:each) do
    @brewery = Factory(:brewery)
    @state = Factory(:state)
    @country = Factory(:country)
    @attr = { :street => "123 Main St.",
              :city => "Beerville",
              :postal_code => "12345",
              :state => @state,
              :country => @country,
              :brewery => @brewery }
  end

  it "should create a new address instance" do
    Address.create!(@attr)
  end

  describe "state association" do
    
    before(:each) do
      @address = Address.new(@attr)
    end
  
    it "should have a state attribute" do
      @address.should respond_to(:state)
    end

    it "should have the correct state" do
      @address.state.should == @state
    end
  end

  describe "country association" do
    
    before(:each) do
      @address = Address.new(@attr)
    end
  
    it "should have a country attribute" do
      @address.should respond_to(:country)
    end

    it "should have the correct country" do
      @address.country.should == @country
    end
  end

  describe "brewery association" do
    
    before(:each) do
      @address = Address.new(@attr)
    end
  
    it "should have a brewery attribute" do
      @address.should respond_to(:brewery)
    end

    it "should have the correct brewery" do
      @address.brewery.should == @brewery
    end
  end
end
