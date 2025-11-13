Rails.application.routes.draw do

  devise_for :users
  resources :games
  resources :reviews
  resources :posts
  resources :users, only: [:show, :edit, :update]

  root         to: "homes#top"
  get "about", to: "homes#about"
  patch 'users/withdraw', to: 'users#withdraw', as: 'withdraw_user'
end
