Rails.application.routes.draw do

devise_for :users
resources :users
resources :events


	resources :home, only: [:index]
  
  get 'home/secret'

  get 'index', to: 'event#index'

  resources :users
  resources :events

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
