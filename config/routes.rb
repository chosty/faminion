Rails.application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => 'user_sessions#new'

  resources :families
  resources :users do
    get 'icon' => 'users#icon_download'
    post 'icon' => 'users#icon_upload'
  end
  resources :events
  resources :event_target_users
  resources :event_posts
  resources :posts do
    get 'picture/:picture_id' => 'posts#picture_download'
    post 'picture' => 'posts#picture_upload'
  end
  resources :post_favs
end
