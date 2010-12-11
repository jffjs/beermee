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

  describe "GET 'create'" do
    
    describe "success" do
      
      before(:each) do
        beer = Factory(:beer)
        place = Factory(:place)
        @attr = { :beer => beer,
                  :place_name => place.name,
                  :user => @user }
      end

      it "should create a new beer" do
        lambda do
          post :create, :activity => @attr
        end.should change(Activity, :count).by(1)
      end

      it "should redirect to the 'index' page" do
        post :create, :activity => @attr
        response.should redirect_to(root_path)
      end
    end

  end

  describe "DELETE 'destroy'" do
  
  end

end
