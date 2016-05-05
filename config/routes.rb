Rails.application.routes.draw do
  resources :families
  resources :users
  resources :events
  resources :event_target_users
  resources :event_posts
  resources :posts
  resources :post_favs
end
