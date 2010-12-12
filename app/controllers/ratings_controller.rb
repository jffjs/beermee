class RatingsController < ApplicationController
  before_filter :authenticate_user!

  # PUT /ratings/:id
  def update
    @rating = current_user.ratings.find_by_beer_id(params[:rating][:beer_id])
    
    if @rating.update_attributes(params[:rating])
      respond_to do |format|
        format.js
      end
    end
  end

  # POST /ratings
  def create
    @rating = current_user.ratings.build(params[:rating])
    
    if @rating.save
      respond_to do |format|
        format.js
      end
    end
  end
end
