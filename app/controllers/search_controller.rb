class SearchController < ApplicationController
  #GET /search
  def index
    @search = Beer.search(params[:search])
    @beers = @search.all

    respond_to do |format|
      format.html
    end
  end

end
