class PagesController < ApplicationController

  def home
    @search = Beer.search
    @activities = current_user.activities if user_signed_in?

    respond_to do |format|
      format.html
    end
  end
end
