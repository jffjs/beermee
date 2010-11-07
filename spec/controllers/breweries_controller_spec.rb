require 'spec_helper'

describe BreweriesController do
  render_views

  describe "GET index" do
    
    before(:each) do
      @breweries = [Factory(:brewery)]
      31.times do
        @breweries << Factory(:brewery, :name => Factory.next(:brewery_name))
      end
    end
        
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have an element for each brewery" do
      get :index
      @breweries[0..2].each do |brewery|
        response.should have_selector("li", :content => brewery.name)
      end
    end

    it "should paginate the results" do
      get :index
      response.should have_selector("div.pagination")
      response.should have_selector("span.disabled", :content => "Previous")
      response.should have_selector("a", :href => "/breweries?page=2",
                                         :content => "Next")
      response.should have_selector("a", :href => "/breweries?page=2",
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
      response.should have_selector("input[name='brewery[name]'][type='text']")
    end

    it "should have a website field" do
      get :new
      response.should have_selector("input[name='brewery[website]'][type='text']")
    end

    it "should have a city field" do
      get :new
      response.should have_selector("input[name='brewery[city]'][type='text']")
    end

    it "should have a country select" do
      get :new
      response.should have_selector("select[name='brewery[country_id]']")
    end

    it "should have a state select" do
      get :new
      response.should have_selector("select[name='brewery[state_id]']")
    end

    it "should have an address field" do
      get :new
      response.should have_selector("input[name='brewery[address]'][type='text']")
    end

    it "should have a zipcode field" do
      get :new
      response.should have_selector("input[name='brewery[zipcode]'][type='text']")
    end

    it "should have an info text area" do
      get :new
      response.should have_selector("textarea[name='brewery[info]']")
    end
  end

  describe "POST create" do
    
    describe "success" do
      
      before(:each) do
        @attr = { :name       => "Sample Brewery", 
                  :city       => "Townsville",
                  :country_id => 214,
                  :state_id   => 15,
                  :address    => "123 Main St.",
                  :zipcode    => "12345",
                  :info       => "Some sample info." }
      end

      it "should create a brewery" do
        lambda do
          post :create, :brewery => @attr
        end.should change(Brewery, :count).by(1)
      end

      it "should redirect to the 'index' page" do
        post :create, :brewery => @attr
        response.should redirect_to(breweries_path)
      end
    end

    describe "failure" do
      
      before(:each) do
        @attr = { :name       => "", 
                  :city       => "",
                  :country_id => nil,
                  :state_id   => nil,
                  :address    => "",
                  :zipcode    => "",
                  :info       => "" }
      end

      it "should not create a brewery" do
        lambda do
          post :create, :brewery => @attr
        end.should change(Brewery, :count).by(0)
      end

      it "should render the 'new' page" do
        post :create, :brewery => @attr
        response.should render_template('new')
      end
    end
  end

  describe "GET show" do
    
    before(:each) do
      @brewery = Factory(:brewery)
    end

    it "should be successful" do
      get :show, :id => @brewery
      response.should be_success
    end

    it "should find the right brewery" do
      get :show, :id => @brewery
      assigns(:brewery).should == @brewery
    end

    it "should include the brewery name" do
      get :show, :id => @brewery
      response.should have_selector("h2", :content => @brewery.name)
    end
  end

  describe "GET edit" do
    
    before(:each) do
      @brewery = Factory(:brewery)
    end

    it "should be successful" do
      get :edit, :id => @brewery
      response.should be_success
    end

    it "should have the right brewery" do
      get :edit, :id => @brewery
      assigns(:brewery).should == @brewery
    end

    it "should have a name field" do
      get :edit, :id => @brewery
      response.should have_selector("input[name='brewery[name]'][type='text']")
    end

    it "should have a city field" do
      get :edit, :id => @brewery
      response.should have_selector("input[name='brewery[city]'][type='text']")
    end

    it "should have a country select" do
      get :edit, :id => @brewery
      response.should have_selector("select[name='brewery[country_id]']")
    end

    it "should have a state select" do
      get :edit, :id => @brewery
      response.should have_selector("select[name='brewery[state_id]']")
    end

    it "should have an address field" do
      get :edit, :id => @brewery
      response.should have_selector("input[name='brewery[address]'][type='text']")
    end

    it "should have a zipcode field" do
      get :edit, :id => @brewery
      response.should have_selector("input[name='brewery[zipcode]'][type='text']")
    end

   it "should have an info text area" do
      get :edit, :id => @brewery
      response.should have_selector("textarea[name='brewery[info]']")
    end
  end

  describe "PUT update" do
    
    before(:each) do
      @brewery = Factory(:brewery)
    end

    describe "success" do
      
      before(:each) do
        @attr = { :name       => "New Name", 
                  :city       => "new city",
                  :country_id => 15,
                  :state_id   => nil,
                  :address    => "new address",
                  :zipcode    => "09876",
                  :info       => "new info" }
      end

      it "should change the brewery's attributes" do
        put :update, :id => @brewery, :brewery => @attr
        brewery = assigns(:brewery)
        @brewery.reload
        @brewery.name.should == brewery.name
        @brewery.city.should == brewery.city
        @brewery.country_id.should == brewery.country_id
        @brewery.address.should == brewery.address
        @brewery.zipcode.should == brewery.zipcode
        @brewery.info.should == brewery.info
      end

      it "should redirect to the brewery show page" do
        put :update, :id => @brewery, :brewery => @attr
        response.should redirect_to(brewery_path(@brewery))
      end

      it "should have a flash message" do
        put :update, :id => @brewery, :brewery => @attr
        flash[:success].should =~ /updated/
      end
    end

    describe "failure" do

      before(:each) do
        @attr = { :name       => "", 
                  :city       => "",
                  :country_id => nil,
                  :state_id   => nil,
                  :address    => "",
                  :zipcode    => "",
                  :info       => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @brewery, :brewery => @attr
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do

    before(:each) do
      @brewery = Factory(:brewery)
    end

    it "should remove the brewery" do
      lambda do
        delete :destroy, :id => @brewery
      end.should change(Brewery, :count).by(-1)
    end

    it "should redirect to the 'index' page" do
      delete :destroy, :id => @brewery
      response.should redirect_to(breweries_path)
    end
  end

  describe "GET autocomplete_brewery_name" do
    
    before(:each) do
      @brewery = Factory(:brewery)
    end

    it "should be successful" do
      get :autocomplete_brewery_name, :term => "Sample"
      response.should be_success
    end
  end
end
