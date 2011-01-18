require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { :email => "test@test.com",
              :password => "password",
              :password_confirmation => "password" }
  end

  describe "validations" do
    
    it "should require an email" do
      user = User.new(@attr.merge(:email => ""))
      user.should_not be_valid
    end

    it "should have a valid email" do
      user = User.new(@attr.merge(:email => "foobar"))
      user.should_not be_valid
    end

    it "should require a password" do
      user = User.new(@attr.merge(:password => ""))
      user.should_not be_valid
    end

    it "should reject a password less than 6 characters long" do
      user = User.new(@attr.merge(:password => "foo"))
      user.should_not be_valid
    end

    it "should reject a password greater than 20 characters" do
      user = User.new(@attr.merge(:password => "a" * 21))
      user.should_not be_valid
    end

    it "should require a password confirmation" do
      user = User.new(@attr.merge(:password_confirmation => ""))
      user.should_not be_valid
    end

    it "should reject different password and password confirmation" do
      user = User.new(@attr.merge(:password_confirmation => "foobar"))
      user.should_not be_valid
    end
  end

  describe "activities association" do
    
    before(:each) do
      @user = User.create(@attr)
      @beer = Factory(:beer)
      @a1 = Factory(:activity, :beer => @beer, :user => @user, :created_at => 1.day.ago)
      @a2 = Factory(:activity, :beer => @beer, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have an activities attribute" do
      @user.should respond_to :activities
    end

    it "should have activities in the correct order" do
      @user.activities.should == [@a2, @a1]
    end

    it "should destroy associated activities" do
      @user.destroy
      [@a1, @a2].each do |activity|
        Activity.find_by_id(activity.id).should be_nil
      end
    end
  end

  describe "ratings association" do
    
    before(:each) do
      @user = User.create(@attr)
      b1 = Factory(:beer)
      b2 = Factory(:beer, :name => "Beer 2", :brewery => Factory(:brewery, :name => "Brewery 2"))
      @r1 = Factory(:rating, :beer => b1, :user => @user)
      @r2 = Factory(:rating, :beer => b2, :user => @user)
    end

    it "should have a ratings attribute" do
      @user.should respond_to :ratings
    end

    it "should destroy associated ratings when it's destroyed" do
      @user.destroy
      [@r1, @r2].each do |rating|
        Rating.find_by_id(rating.id).should be_nil
      end
    end
  end

end
