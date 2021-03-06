module RatingsHelper
  def star_rating(options={})
    readonly = options[:readonly] ? options[:readonly] : false
    checked = options[:rating] ? options[:rating] : current_user_rating
    render :partial => 'ratings/stars', :locals => { :readonly => readonly,
                                                     :checked => checked } 
  end

  def current_user_rating
    if user_signed_in?
      if rating = current_user.ratings.find_by_beer_id(params[:beer])
        return rating.score
      end
    end

    return 0 # default value
  end

  def current_user_rating_for(beer)
    if user_signed_in?
      rating = current_user.ratings.find_by_beer_id(beer.id)
      return rating.score unless rating.nil?
    end

    return 0  # no rating
  end
        
end
