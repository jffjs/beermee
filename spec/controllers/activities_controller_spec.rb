require 'spec_helper'

describe ActivitiesController do
  render_views
  login_user


  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    
    describe "success" do
      
      before(:each) do
        beer = Factory(:beer)
        place = Factory(:place)
        @rating = { :beer => beer, :user => @user }
        @attr = { :beer => beer,
                  :place_name => place.name,
                  :user => @user }
      end

      it "should create a new activity" do
        lambda do
          post :create, :activity => @attr, :rating => @rating
        end.should change(Activity, :count).by(1)
      end

      it "should create a rating if notes provided" do
        lambda do
          post :create, :activity => @attr, :rating => @rating.merge(:notes => "Test")
        end.should change(Rating, :count).by(1)
      end

      it "should not create a rating if no notes provided" do
        lambda do
          post :create, :activity => @attr, :rating => @rating
        end.should change(Rating, :count).by(0)
      end

      it "should redirect to the 'index' page" do
        post :create, :activity => @attr, :rating => @rating
        response.should redirect_to(root_path)
      end
    end

  end

  describe "DELETE 'destroy'" do
  
  end

end
