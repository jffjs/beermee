module BeersHelper

  def beer_link(beer)
    link_to beer.name, beer
  end

  def beer_styles
    Style.find(:all).sort! do |a,b| 
      a.name.downcase <=> b.name.downcase
    end.collect { |c| [c.name, c.id] } 
  end
end
