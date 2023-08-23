Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :posts, only: [:index, :create, :new]
end
