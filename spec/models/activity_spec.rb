require 'spec_helper'

describe Activity do

  before(:each) do
    @place  = Factory(:place)
    @beer   = Factory(:beer)
    @user   = Factory(:user)
    @attr   = { :place => @place,
                :beer => @beer }
  end

  it "should create an activity" do
    @user.activities.create!(@attr)
  end
  
  describe "validations" do
    
    it "should require a beer" do
      activity = @user.activities.build(@attr.merge(:beer => nil))
      activity.should_not be_valid
    end

    it "should require a user" do
      activity = Activity.new(@attr)
      activity.should_not be_valid
    end
  end

  describe "beer association" do
    
    before(:each) do
      @activity = Activity.new(@attr)
    end

    it "should have a beer attribute" do
      @activity.should respond_to :beer
    end

    it "should reference the correct beer" do
      @activity.beer.should == @beer
    end
  end

  describe "place association" do
    
    before(:each) do
      @activity = Activity.new(@attr)
    end

    it "should have a place attribute" do
      @activity.should respond_to :place
    end

    it "should reference the correct place" do
      @activity.place.should == @place
    end
  end

  describe "user association" do
    
    before(:each) do
      @activity = @user.activities.build(@attr)
    end

    it "should have a user attribute" do
      @activity.should respond_to :user
    end

    it "should reference the correct user" do
      @activity.user.should == @user
    end
  end
end

