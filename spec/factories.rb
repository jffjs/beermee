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
  brewery.association :country
  brewery.association :state
  brewery.city        "Kalamazoo"
  brewery.address     "123 Main St."
  brewery.zipcode     "12345"
  brewery.info        "Some brewery info..."
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

Factory.sequence :beer_name do |n|
  "Beer #{n}"
end
