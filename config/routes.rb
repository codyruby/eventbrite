Rails.application.routes.draw do
  get 'attendances/index'

  get 'attendances/new'

  get 'attendances/create'

  get '/profil', to: 'users#show'

  devise_for :users 
  
  resources :events
  resources :charges
  
  post "events/subscribe/:id", to: "events#subscribe", as: "event_subscription"
  
  root 'events#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
