require 'spec_helper'

describe RatingsController do
  render_views
  login_user

  describe "PUT 'update'" do
    
    before(:each) do
      @rating = Factory(:rating, :user => @user)
    end
  
    describe "success" do
      
      before(:each) do
        @attr = { :user_id => @user.id,
                  :beer_id => @rating.beer.id,
                  :score => 4.0 }
      end

      it "should update the rating's score" do
        put :update, :id => @rating, :rating => @attr
        rating = assigns(:rating)
        @rating.reload
        @rating.score.should == rating.score
      end
    end
  end

  describe "POST 'create'" do
    
    describe "success" do
      
      before(:each) do
        beer = Factory(:beer)
        @attr = { :beer => beer,
                  :user => @user,
                  :score => 3.0 }
      end

      it "should create a new activity" do
        lambda do
          post :create, :rating => @attr
        end.should change(Rating, :count).by(1)
      end
    end
  end
end
