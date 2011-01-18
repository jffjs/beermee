require 'spec_helper'

describe StylesController do
  render_views

  describe "GET 'index'" do

    before(:each) do
      @styles = [Factory(:style)]
      20.times do
        @styles << Factory(:style, :name => Factory.next(:style_name))
      end
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have a link for each style" do
      get :index
      @styles.each do |style|
        response.should have_selector("a", :content => style.name)
      end
    end
  end

  describe "GET 'show'" do
    
    before(:each) do
      @style = Factory(:style)
    end

    it "should be successful" do
      get :show, :id => @style
      response.should be_success
    end

    it "should have a link to each of its beers" do
      beer1 = Factory(:beer, :style => @style)
#beer2 = Factory(:beer, :style => @style, :name => "beer2", :brewery => nil)

      get :show, :id => @style
      @style.beers.each do |beer|
        response.should have_selector("a", :content => beer.name)
      end
    end

    it "should link back to Styles index" do
      get :show, :id => @style
      response.should have_selector("a", :href => styles_path, :content => "Beer Styles")
    end
  end
end
