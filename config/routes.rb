Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {  sessions: 'custom_devise/sessions' }
  
  # ROTAS MOVIE
  resources :movies
  # # ROTAS STUDIO
  resources :studios
  # # ROTAS ATORES
  resources :actors
end