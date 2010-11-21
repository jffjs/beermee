class StylesController < ApplicationController
  
  # GET /styles
  def index
    @styles = Style.find(:all, :order => :name)

    respond_to do |format|
      format.html
    end
  end

  # GET /styles/:id
  def show
    @style = Style.find(params[:id])
    @beers = @style.beers.paginate(:page => params[:page])
    
    respond_to do |format|
      format.html
    end
  end

end
