Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]
  resources :pitches, only: [:index, :new, :create, :show]
  resources :teams, only: [:show, :index, :new, :create]
  resources :sessions, only: [:new, :create]
  resources :votes, only:[:create, :new]

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#logout'
  
  root to: 'sessions#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
