Beermee::Application.routes.draw do
  resources :beers do
    get :autocomplete_brewery_name, :on => :collection
  end 

  resources :breweries
  resources :places
  resources :styles, :only => [:index, :show]

  root :to => "pages#home"
end
