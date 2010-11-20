Beermee::Application.routes.draw do
  get "styles/index"

  get "styles/show"

  resources :beers do
    get :autocomplete_brewery_name, :on => :collection
  end 

  resources :breweries

  root :to => "pages#home"
end
