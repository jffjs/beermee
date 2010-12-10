class PagesController < ApplicationController

  def home
    if user_signed_in?
      @activities = current_user.activities
    end

    respond_to do |format|
      format.html
    end
  end
end
