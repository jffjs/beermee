Beermee::Application.routes.draw do
  resources :beers do
    get :autocomplete_brewery_name, :on => :collection
  end 

  resources :breweries
  resources :styles

  root :to => "pages#home"
end
