Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # ROTAS MOVIE
  resources :movies
  # # ROTAS STUDIO
  resources :studios
  # # ROTAS ATORES
  resources :actors
end