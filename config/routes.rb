Rails.application.routes.draw do

  devise_for :users
  root         to: "public/homes#top"
  get "about", to: "public/homes#about"
  namespace :public do
    resources :games
    resources :posts
    resources :users, only: [:show, :edit, :update] do
      member do
        patch :withdraw
      end
    end
  end
end
