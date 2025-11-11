Rails.application.routes.draw do

  devise_for :users
  resources :games
  resources :reviews
  resources :posts
  resource :user, only: [:edit, :update]do
    patch :withdraw
  end
  root         to: "homes#top"
  get "about", to: "homes#about"
  get 'user/my_page', to: 'users#show', as: 'my_page'
end
