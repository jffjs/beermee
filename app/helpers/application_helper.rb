module ApplicationHelper

  def logo
    image_tag("logo1.png", :alt => "BeerMee")
  end

  def thumbnail(item)
    image_tag item.image.url(:thumb), :alt => item.name
  end
end
