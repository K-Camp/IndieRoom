Rails.application.routes.draw do

  devise_for :users
  resources :games
  resources :reviews
  resources :posts
  resources :users, only: [:show, :edit, :update] do
    member do
      patch :withdraw
    end
  end

  root         to: "homes#top"
  get "about", to: "homes#about"
end
