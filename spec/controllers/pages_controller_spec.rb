require 'spec_helper'

describe PagesController do
  render_views

  describe "GET home" do
  
    it "should be successful" do
      get :home
      response.should be_success
    end

    it "should have the right title" do
      get :home
      response.should have_selector("title", :content => "openbeer - the free and open beer database")
    end

    it "should have a link to Breweries in navigation" do
      get :home
      response.should have_selector("li>a", :href => breweries_path,
                                             :content => "Breweries")
    end
  end
end
