Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :destroy]
  resources :pitches, only: [:index, :new, :create, :show]
  resources :teams, only: [:show, :index, :new, :create]
  resources :sessions, only: [:new, :create]
  resources :rounds, only: [:index, :show] do
    resources :votes, only: [:new, :create]
  end

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#logout'

  post '/create_round' => 'rounds#create_round'
  post '/open_round' => 'rounds#open_round'
  post '/close_round' => 'rounds#close_round'
  post '/move_to_next_round' => 'pitches#move_to_next_round'
  
  root to: 'sessions#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
