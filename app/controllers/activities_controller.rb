class ActivitiesController < ApplicationController
  autocomplete :place, :name, :full => true

  def new
    @activity = Activity.new(:beer_id => params[:beer])

    respond_to do |format|
      format.html
    end
  end

  def create
    @activity = current_user.activities.build(params[:activity])
    @activity.activity_type = "log"

    if @activity.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  end

end
