require 'spec_helper'

describe BeersController do
  render_views

  before(:each) do
    @style = Factory(:style)
    @style.save!
  end

  describe "GET index" do
    
    before(:each) do
      @brewery = Factory(:brewery)
      @beers = [Factory(:beer, :brewery => @brewery)]
      31.times do |n|
        @beers << Factory(:beer, :name => Factory.next(:beer_name), :brewery => @brewery)
      end
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have an element for each beer" do
      get :index
      @beers[0..2].each do |beer|
        response.should have_selector("li", :content => beer.name)
      end
    end

    it "should paginate the results" do
      get :index
      response.should have_selector("div.pagination")
      response.should have_selector("span.disabled", :content => "Previous")
      response.should have_selector("a", :href => "/beers?page=2",
                                         :content => "Next")
      response.should have_selector("a", :href => "/beers?page=2",
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
      response.should have_selector("input[name='beer[name]'][type='text']")
    end

    it "should have a brewery autocomplete field" do
      get :new
      response.should have_selector("input[name='beer[brewery_name]'][type='text']")
    end

    it "should have a description text area" do
      get :new
      response.should have_selector("textarea[name='beer[description]']")
    end

    it "should have an ABV field" do
      get :new
      response.should have_selector("input[name='beer[abv]'][type='text']")
    end

    it "should have an IBU field" do
      get :new
      response.should have_selector("input[name='beer[ibu]'][type='text']")
    end

    describe "from Brewery" do
      
      before(:each) do
        @brewery = Factory(:brewery)
      end

      it "should prefill the brewery autocomplete field with name" do
        get :new, :brewery_id => @brewery.id
        response.should have_selector("input[name='beer[brewery_name]'][type='text']
                                        [value='#{@brewery.name}']")
      end

      it "should have the correct brewery_id set for the beer" do
        get :new, :brewery_id => @brewery.id
        assigns(:beer).brewery_id.should == @brewery.id
      end
    end
  end

  describe "POST create" do
    
    describe "success" do
      
      before(:each) do
        @attr = { :name => "Sample beer",
                  :description => "Sample desc...",
                  :style_id => 1,
                  :brewery_id => 1,
                  :abv => 5,
                  :ibu => 50 }
      end

      it "should create a new beer" do
        lambda do
          post :create, :beer => @attr
        end.should change(Beer, :count).by(1)
      end

      it "should redirect to the 'index' page" do
        post :create, :beer => @attr
        response.should redirect_to(beers_path)
      end
    end

    describe "failure" do
    
      before(:each) do
        @attr = { :name => "",
                  :description => "",
                  :style_id => 1,
                  :brewery_id => 1,
                  :abv => 5,
                  :ibu => 50 }
      end

      it "should not create a new beer" do
        lambda do
          post :create, :beer => @attr
        end.should change(Beer, :count).by(0)
      end

      it "should render the 'new' page" do
        post :create, :beer => @attr
        response.should render_template('new')
      end
    end
  end

  describe "GET show" do
    
    before(:each) do
      @beer = Factory(:beer)
    end

    it "should be successful" do
      get :show, :id => @beer
      response.should be_success
    end

    it "should find the right beer" do
      get :show, :id => @beer
      assigns(:beer).should == @beer
    end

    it "should include the beer name" do
      get :show, :id => @beer
      response.should have_selector("h2", :content => @beer.name)
    end
  end

  describe "GET edit" do
    
    before(:each) do
      @beer = Factory(:beer)
    end

    it "should be successful" do
      get :edit, :id => @beer
      response.should be_success
    end

    it "should have the right beer" do
      get :edit, :id => @beer
      assigns(:beer).should == @beer
    end

    it "should have a name field" do
      get :edit, :id => @beer
      response.should have_selector("input[name='beer[name]'][type='text']")
    end

    it "should have a brewery autocomplete field" do
      get :edit, :id => @beer
      response.should have_selector("input[name='beer[brewery_name]'][type='text']")
    end

    it "should have a description text area" do
      get :edit, :id => @beer
      response.should have_selector("textarea[name='beer[description]']")
    end

    it "should have an ABV field" do
      get :edit, :id => @beer
      response.should have_selector("input[name='beer[abv]'][type='text']")
    end

    it "should have an IBU field" do
      get :edit, :id => @beer
      response.should have_selector("input[name='beer[ibu]'][type='text']")
    end
  end
  
  describe "PUT update" do
    
    before(:each) do
      @beer = Factory(:beer)
    end

    describe "success" do
      
      before(:each) do
        @attr = { :name => "New beer",
                  :description => "New desc...",
                  :style_id => 2,
                  :brewery_id => 2,
                  :abv => 7,
                  :ibu => 55 }
      end

      it "should update the beer's attributes" do
        put :update, :id => @beer, :beer => @attr
        beer = assigns(:beer)
        @beer.reload
        @beer.name.should == beer.name
        @beer.description.should == beer.description
        @beer.style_id.should == beer.style_id
        @beer.brewery_id.should == beer.brewery_id
        @beer.abv.should == beer.abv
        @beer.ibu.should == beer.ibu
      end

      it "should redirect to the beer show page" do
        put :update, :id => @beer, :beer => @attr
        response.should redirect_to(beer_path(@beer))
      end

      it "should have a flash message" do
        put :update, :id => @beer, :beer => @attr
        flash[:success].should =~ /updated/
      end
    end

    describe "failure" do
    
      before(:each) do
        @attr = { :name => "",
                  :description => "",
                  :style_id => 1,
                  :brewery_id => 1,
                  :abv => 5,
                  :ibu => 50 }
      end

      it "should render the edit page" do
        put :update, :id => @beer, :beer => @attr
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    
    before(:each) do
      @beer = Factory(:beer)
    end

    it "should remove the beer" do
      lambda do
        delete :destroy, :id => @beer
      end.should change(Beer, :count).by(-1)
    end

    it "should redirect to the index page" do
      delete :destroy, :id => @beer
      response.should redirect_to(beers_path)
    end
  end  
end
