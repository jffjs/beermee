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
end
