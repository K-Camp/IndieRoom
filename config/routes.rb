Rails.application.routes.draw do

  devise_for :users
  resources :games
  resources :reviews
  resources :posts
  resources :users
  root         to: "homes#top"
  get "about", to: "homes#about"
  get 'user/my_page', to: 'users#show', as: 'my_page'
end
