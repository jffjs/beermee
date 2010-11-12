class BeersController < ApplicationController
  autocomplete :brewery, :name, :full => true

  # GET /beers
  def index
    @beers = Beer.paginate(:page => params[:page])

    respond_to do |format|
      format.html
    end
  end

  # GET /beers/new
  def new
    @beer = Beer.new

    if params[:brewery_id].nil?
      @brewery_name = ""
    else
      @brewery_name = Brewery.find(params[:brewery_id]).name 
      @beer.brewery_id = params[:brewery_id]
    end

    respond_to do |format|
      format.html
    end
  end

  # POST /beers
  def create
    @beer = Beer.new(params[:beer])
    
    if @beer.save
      flash[:success] = "Beer successfully added"
      redirect_to beers_path
    else
      render 'new'
    end
  end

  # GET /beers/:id
  def show
    @beer = Beer.find(params[:id])

    respond_to do |format| 
      format.html
    end
  end

  # GET /beers/:id/edit
  def edit
    @beer = Beer.find(params[:id])
    @brewery_name = @beer.brewery.name

    respond_to do |format|
      format.html
    end
  end

  # PUT /beers/:id
  def update
    @beer = Beer.find(params[:id])

    if @beer.update_attributes(params[:beer])
      flash[:success] = "Beer updated"
      redirect_to @beer
    else
      render 'edit'
    end
  end

  # DELETE /beers/:id
  def destroy
    Beer.find(params[:id]).destroy
    flash[:success] = "Beer destroyed"
    redirect_to beers_path
  end
end
