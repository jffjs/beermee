Factory.define(:beer) do |beer|
  beer.name         "Oberon"
  beer.description  "A summer wheat ale"
  beer.abv          "5.0"
  beer.ibu          "60"
  beer.website      "http://www.goodsite.com"
  beer.association  :brewery
  beer.association  :style
end

Factory.define(:style) do |style|
  style.name        "American Stout"
end

Factory.define(:brewery) do |brewery|
  brewery.name        "Sample brewery"
  brewery.description "Some brewery info..."
  brewery.website     "http://www.beer.com"
end

Factory.define(:place) do |place|
  place.name          "Sample Place"
  place.description   "Some place info..."
  place.website       "http://www.place.com"
  place.group         "Bar"
end

Factory.define(:user) do |user|
  user.email          "test@test.com"
  user.password       "password"
  user.password_confirmation  "password"
end

Factory.define(:activity) do |activity|
  activity.association  :beer
  activity.association  :place
end

Factory.define(:address) do |address|
  address.street      "123 Main st."
  address.city        "Beerville"
  address.postal_code "12345"
  address.association :state
  address.association :country
end

Factory.define(:state) do |state|
  state.name         "Michigan"
  state.abbreviation "MI"
end

Factory.define(:country) do |country|
  country.name  "United States"
  country.iso   "US"
  country.iso3  "USA"
  country.numcode 84
end

Factory.sequence :brewery_name do |n|
  "Brewery #{n}"
end

Factory.sequence :place_name do |n|
  "Place #{n}"
end

Factory.sequence :beer_name do |n|
  "Beer #{n}"
end

Factory.sequence :style_name do |n|
  "Style #{n}"
end
