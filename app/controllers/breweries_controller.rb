class BreweriesController < ApplicationController
  autocomplete :brewery, :name

  # GET /breweries
  def index
    if request.format.js?
      @breweries = Brewery.find(:all, 
                              :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    elsif request.format.html?
      @breweries = Brewery.paginate(:page => params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
    end
  end

  # GET /breweries/new
  def new
    @brewery = Brewery.new
    @brewery.country = Country.find_by_iso3("USA")

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /breweries
  def create
    @brewery = Brewery.new(params[:brewery])
    if @brewery.save
      flash[:success] = "Brewery successfully added"
      redirect_to breweries_path
    else
      render 'new'
    end
  end

  # GET /breweries/:id
  def show
    @brewery = Brewery.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /breweries/:id/edit
  def edit
    @brewery = Brewery.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  # PUT /breweries/:id
  def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update_attributes(params[:brewery])
      flash[:success] = "Brewery updated."
      redirect_to @brewery
    else
      render 'edit'
    end
  end
  
  # DELETE /breweries/:id
  def destroy
    Brewery.find(params[:id]).destroy
    flash[:success] = "Brewery destroyed."
    redirect_to breweries_path
  end
end
