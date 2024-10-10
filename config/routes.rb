Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  mount_devise_token_auth_for 'User', at: 'auth'

  # ROTAS MOVIE
  resources :movies do
    member do 
      post :like
    end 
  end

  # # ROTAS STUDIO
  resources :studios
  # # ROTAS ATORES
  resources :actors
end