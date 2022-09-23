Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'

  get '/profile/:username', to: 'users#show', as: 'user'
  get '/profile/:username/bio', to: 'users#bio', as: 'user_bio'
  post '/profile/:username/bio', to: 'users#edit_bio'

  get '/profile/:username/bikes', to: 'bikes#index', as: 'user_bikes'
  get '/profile/:username/bikes/new', to: 'bikes#new', as: 'new_bike'
  post '/profile/:username/bikes/new', to: 'bikes#create'
  get '/profile/:username/bikes/:id', to: 'bikes#show', as: 'bike'
  get '/profile/:username/bikes/:id/edit', to: 'bikes#edit', as: 'edit_bike'
  patch '/profile/:username/bikes/:id/edit', to: 'bikes#update'
  delete '/profile/:username/bikes/:id', to: 'bikes#delete', as: 'delete_bike'

  get '/profile/:username/rides', to: 'rides#user_index', as: 'user_rides'
  get '/rides', to: 'rides#index'
  get '/rides/new', to: 'rides#new', as: 'new_ride'
  post '/rides', to: 'rides#create'
  get '/rides/:id', to: 'rides#show', as: 'ride'
  get '/rides/:id/edit', to: 'rides#edit', as: 'edit_ride'
  patch '/rides/:id/complete', to: 'rides#complete', as: 'complete_ride'
  patch '/rides/:id/join', to: 'rides#join', as: 'join_ride'
  patch '/rides/:id/leave', to: 'rides#leave', as: 'leave_ride'
  patch '/rides/:id', to: 'rides#update'
  delete '/rides/:id', to: 'rides#delete', as: 'delete_ride'

  get '/leaderboard', to: 'leaderboard#index'

  get '/auth/github/callback' => 'session#omniauth'
end
