class PlacesController < ApplicationController

  # GET /places
  def index
    @places = Place.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /places/new
  def new
    @place = Place.new
    @place.build_address.country = Country.find_by_iso3("USA")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /places
  def create
    @place = Place.new(params[:place])
    if @place.save
      flash[:success] = "Place successfully added"
      redirect_to places_path
    else
      render 'new'
    end
  end

  # GET /places/:id
  def show
    @place = Place.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /places/:id/edit
  def edit
    @place = Place.find(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  # PUT /places/:id
  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      flash[:success] = "Place updated."
      redirect_to @place
    else
      render 'edit'
    end
  end

  # DELETE /places/:id
  def destroy
    Place.find(params[:id]).destroy
    flash[:success] = "Place destroyed."
    redirect_to places_path
  end
end
