Rails.application.routes.draw do

  get 'avatars/create'
  get '/profil', to: 'users#show'

  devise_for :users 
  
  resources :events do
    resources :avatars, only: [:create]
  end
  resources :charges
  resources :attendances

  post "events/subscribe/:id", to: "events#subscribe", as: "event_subscription"
  get "events/subscribe/:id", to: "events#subscribe_free", as: "event_subscription_free"
  
  root 'events#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
