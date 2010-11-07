Beermee::Application.routes.draw do
  resources :beers
  resources :breweries do
    get :autocomplete_brewery_name, :on => :collection
  end

  resources :breweries

  root :to => "breweries#index"
end
