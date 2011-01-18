module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def logo
    image_tag("logo-1.png", :alt => "BeerMee", :class => "logo" )
  end

  def thumbnail(item)
    image_tag item.image.url(:thumb), :alt => item.name, :class => "thumb"
  end

  def social_icon(provider, size)
    link_to(image_tag("social_icons/#{provider}_#{size}.png",
                      :alt => "Sign in with #{provider.to_s.titleize}"),
            "/auth/#{provider}")
  end
end
