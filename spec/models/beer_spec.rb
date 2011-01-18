require 'spec_helper'

describe Beer do

  before(:each) do
    @brewery = Factory(:brewery)
    @style = Factory(:style)
    @attr = { :name => "Sample Beer",
              :description => "Best beer ever.",
              :brewery_id => @brewery.id,
              :style_id => @style.id,
              :abv => 5.0,
              :ibu => 60,
              :website => "http://www.good.com" }
  end

  it "should create a new beer instance given valid attributes" do
    Beer.create!(@attr)
  end

  describe "validations" do
    it "should require a name" do
      no_name_beer = Beer.new(@attr.merge(:name => ""))
      no_name_beer.should_not be_valid
    end

    it "should reject a beer with name > 50 characters" do
      long_name_beer = Beer.new(@attr.merge(:name => "a" * 51))
      long_name_beer.should_not be_valid
    end

    it "should reject a beer with description > 1000 characters" do
      long_desc_beer = Beer.new(@attr.merge(:description => "a" * 1001))
      long_desc_beer.should_not be_valid
    end

    it "should reject a beer with non-numeric ABV" do
      invalid_abv = Beer.new(@attr.merge(:abv => "bad"))
      invalid_abv.should_not be_valid
    end

    it "should reject a beer with ABV > 100" do
      invalid_abv = Beer.new(@attr.merge(:abv => 101))
      invalid_abv.should_not be_valid
    end

    it "should reject a beer with ABV < 0" do
      invalid_abv = Beer.new(@attr.merge(:abv => -1))
      invalid_abv.should_not be_valid
    end

    it "should reject a beer with non-numeric IBU" do
      invalid_ibu = Beer.new(@attr.merge(:ibu => "bad"))
      invalid_ibu.should_not be_valid
    end

    it "should reject a beer with IBU > 200" do
      invalid_ibu = Beer.new(@attr.merge(:ibu => 201))
      invalid_ibu.should_not be_valid
    end

    it "should reject a beer with IBU < 0" do
      invalid_ibu = Beer.new(@attr.merge(:ibu => -1))
      invalid_ibu.should_not be_valid
    end

    it "should require a style id" do
      no_style_beer = Beer.new(@attr.merge(:style_id => nil))
      no_style_beer.should_not be_valid
    end

    it "should reject a beer with an invalid website" do
      bad_url = Beer.new(@attr.merge(:website => "123.website.bad34/"))
      bad_url.should_not be_valid
    end
  end

  describe "brewery association" do
    
    before(:each) do
      @beer = @brewery.beers.create(@attr)
    end

    it "should have a brewery attribute" do
      @beer.should respond_to(:brewery)
    end

    it "should belong to the right brewery" do
      @beer.brewery_id.should == @brewery.id
      @beer.brewery.should == @brewery
    end
  end

  describe "style association" do
    
    before(:each) do
      @beer = @style.beers.create(@attr)
    end

    it "should have a style attribute" do
      @beer.should respond_to(:style)
    end

    it "should belong to the right style" do
      @beer.style_id.should == @style.id
      @beer.style.should == @style
    end
  end

  describe "activities association" do
    
    before(:each) do
      @beer = Beer.create(@attr)
      @user = Factory(:user)
      @a1 = Factory(:activity, :beer => @beer, :user => @user, :created_at => 1.day.ago)
      @a2 = Factory(:activity, :beer => @beer, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have an activities attribute" do
      @beer.should respond_to :activities
    end

    it "should have activities in the correct order" do
      @beer.activities.should == [@a2, @a1]
    end

    it "should destroy associated activities" do
      @beer.destroy
      [@a1, @a2].each do |activity|
        Activity.find_by_id(activity.id).should be_nil
      end
    end
  end

  describe "ratings association" do
    
    before(:each) do
      @beer = Beer.create(@attr)
      u1 = Factory(:user)
      u2 = Factory(:user, :email => "user2@test.com")
      @r1 = Factory(:rating, :beer => @beer, :user => u1)
      @r2 = Factory(:rating, :beer => @beer, :user => u2)
    end

    it "should have a ratings attribute" do
      @beer.should respond_to :ratings
    end

    it "should destroy associated ratings when it's destroyed" do
      @beer.destroy
      [@r1, @r2].each do |rating|
        Rating.find_by_id(rating.id).should be_nil
      end
    end
  end

  describe "brewery_name attribute" do
    
    before(:each) do
      @beer = Beer.new(@attr.merge(:brewery_name => @brewery.name))
    end

    it "should create the correct association when passed an existing name" do
      @beer.brewery.should == @brewery
    end

    it "should return the associated brewery's name" do
      @beer.brewery_name.should == @brewery.name
    end
  end
end
