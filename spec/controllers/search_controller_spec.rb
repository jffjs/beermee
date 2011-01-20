require 'spec_helper'

describe SearchController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should display the correct beer" do
      beer = Factory(:beer)
      get :index, :search => { :name_contains => beer.name }
      response.should have_selector("a", :content => beer.name)
    end
  end

end
