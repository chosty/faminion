Rails.application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => 'user_sessions#new'

  resources :families
  resources :users
  resources :events
  resources :event_target_users
  resources :event_posts
  resources :posts
  resources :post_favs
end
