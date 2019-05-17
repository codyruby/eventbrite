Rails.application.routes.draw do
  get '/profil', to: 'users#show'

  devise_for :users 
  
  resources :events
  resources :charges
  
  root 'events#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
