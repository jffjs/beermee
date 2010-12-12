module RatingsHelper
  def star_rating(options={})
    readonly = options[:readonly] ? options[:readonly] : false
    checked = options[:rating] ? options[:rating] : current_user_rating
    render :partial => 'ratings/stars', :locals => { :readonly => readonly,
                                                     :checked => checked } 
  end

  def current_user_rating
    if rating = current_user.ratings.find_by_beer_id(params[:beer])
      rating.score
    else
      3 # default value
    end
  end
end
