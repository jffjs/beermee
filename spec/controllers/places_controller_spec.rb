require 'spec_helper'

describe PlacesController do
  render_views

  describe "GET index" do
    
    before(:each) do
      @places = [Factory(:place)]
      31.times do
        @places << Factory(:place, :name => Factory.next(:place_name))
      end
    end

    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should have a link for each place" do
      get :index
      @places[0..2].each do |place|
        response.should have_selector("a", :content => place.name)
      end
    end

    it "should paginate the results" do
      get :index
      response.should have_selector("div.pagination")
      response.should have_selector("span.disabled", :content => "Previous")
      response.should have_selector("a", :href => "/places?page=2",
                                         :content => "Next")
      response.should have_selector("a", :href => "/places?page=2",
                                         :content => "2")

    end
  end

  describe "GET new" do
    
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have a name field" do
      get :new
      response.should have_selector("input[name='place[name]'][type='text']")
    end

    it "should have a website field" do
      get :new
      response.should have_selector("input[name='place[website]'][type='text']")
    end

    it "should have a city field" do
      get :new
      response.should have_selector("input[name='place[address_attributes][city]'][type='text']")
    end

    it "should have a country select" do
      get :new
      response.should have_selector("select[name='place[address_attributes][country_id]']")
    end

    it "should have a state select" do
      get :new
      response.should have_selector("select[name='place[address_attributes][state_id]']")
    end

    it "should have an address field" do
      get :new
      response.should have_selector("input[name='place[address_attributes][street]'][type='text']")
    end

    it "should have a zipcode field" do
      get :new
      response.should have_selector("input[name='place[address_attributes][postal_code]'][type='text']")
    end

    it "should have an description text area" do
      get :new
      response.should have_selector("textarea[name='place[description]']")
    end
  end

  describe "POST create" do
    
    describe "success" do
      
      before(:each) do
        @address = Factory(:address)
        @attr = { :name       => "Sample Place", 
                  :address    => @address,
                  :description => "Some sample info.",
                  :group  => "Bar",
                  :website => "http://www.place.com" }
      end

      it "should create a place" do
        lambda do
          post :create, :place => @attr
        end.should change(Place, :count).by(1)
      end

      it "should redirect to the 'index' page" do
        post :create, :place => @attr
        response.should redirect_to(places_path)
      end
    end

    describe "failure" do
      
      before(:each) do
        @attr = { :name       => "", 
                  :address    => nil,
                  :description => "" }
      end

      it "should not create a place" do
        lambda do
          post :create, :place => @attr
        end.should change(Place, :count).by(0)
      end

      it "should render the 'new' page" do
        post :create, :place => @attr
        response.should render_template('new')
      end
    end
  end

  describe "GET show" do
    
    before(:each) do
      @place = Factory(:place)
    end

    it "should be successful" do
      get :show, :id => @place
      response.should be_success
    end

    it "should find the right place" do
      get :show, :id => @place
      assigns(:place).should == @place
    end

    it "should include the place name" do
      get :show, :id => @place
      response.should have_selector("h1", :content => @place.name)
    end
  end

  describe "GET edit" do
    
    before(:each) do
      @address = Factory(:address)
      @place = Factory(:place, :address => @address)
    end

    it "should be successful" do
      get :edit, :id => @place
      response.should be_success
    end

    it "should have the right place" do
      get :edit, :id => @place
      assigns(:place).should == @place
    end

    it "should have a name field" do
      get :edit, :id => @place
      response.should have_selector("input[name='place[name]'][type='text']")
    end

    it "should have a city field" do
      get :edit, :id => @place
      response.should have_selector("input[name='place[address_attributes][city]'][type='text']")
    end

    it "should have a country select" do
      get :edit, :id => @place
      response.should have_selector("select[name='place[address_attributes][country_id]']")
    end

    it "should have a state select" do
      get :edit, :id => @place
      response.should have_selector("select[name='place[address_attributes][state_id]']")
    end

    it "should have an address field" do
      get :edit, :id => @place
      response.should have_selector("input[name='place[address_attributes][street]'][type='text']")
    end

    it "should have a zipcode field" do
      get :edit, :id => @place
      response.should have_selector("input[name='place[address_attributes][postal_code]'][type='text']")
    end

   it "should have an description text area" do
      get :edit, :id => @place
      response.should have_selector("textarea[name='place[description]']")
    end
  end

  describe "PUT update" do
    
    before(:each) do
      @place = Factory(:place)
    end

    describe "success" do
      
      before(:each) do
        @address = Factory(:address)
        @attr = { :name       => "New Name", 
                  :address    =>  @address,
                  :description => "new info" }
      end

      it "should change the place's attributes" do
        put :update, :id => @place, :place => @attr
        place = assigns(:place)
        @place.reload
        @place.name.should == place.name
        @place.description.should == place.description
        @place.address.should == place.address
      end

      it "should redirect to the place show page" do
        put :update, :id => @place, :place => @attr
        response.should redirect_to(place_path(@place))
      end

      it "should have a flash message" do
        put :update, :id => @place, :place => @attr
        flash[:success].should =~ /updated/
      end
    end

    describe "failure" do

      before(:each) do
        @attr = { :name       => "", 
                  :address    => nil,
                  :description => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @place, :place => @attr
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @place = Factory(:place)
    end

    it "should remove the place" do
      lambda do
        delete :destroy, :id => @place
      end.should change(Place, :count).by(-1)
    end

    it "should redirect to the 'index' page" do
      delete :destroy, :id => @place
      response.should redirect_to(places_path)
    end
  end

end
