Rails.application.routes.draw do

root 'events#index'
devise_for :users

resources :events
resources :users
resources :attendances
resources :home, only: [:index]
resources :charges

get "events/subscribe/:id", to: "attendances#subscribe", as:"attendance_subscription"
#get "events/:id/:id", to: "events#adduser"
post "events/subscribe/:id", to: "attendances#subscribe"

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
