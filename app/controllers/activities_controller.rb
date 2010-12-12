class ActivitiesController < ApplicationController
  autocomplete :place, :name, :full => true

  # GET /activites/new
  def new
    @activity = Activity.new(:beer_id => params[:beer])
    @rating = Rating.find_by_beer_id_and_user_id(params[:beer], current_user.id)

    @rating = Rating.new(:beer_id => params[:beer]) unless @rating

    respond_to do |format|
      format.html
    end
  end

  # POST /activities
  def create
    @activity = current_user.activities.build(params[:activity])
    @activity.activity_type = "log"

    @rating = Rating.find_by_beer_id_and_user_id(params[:rating][:beer_id], current_user.id)
    if @rating 
      @rating.update_attributes(params[:rating])
    else
      @rating = current_user.ratings.build(params[:rating])
    end

    if @activity.save && @rating.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

end
