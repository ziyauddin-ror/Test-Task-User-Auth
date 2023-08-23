Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :posts, only: [:index, :create, :new]

  #API Only
  namespace :api do
    namespace :v1 do
      post 'register', to: 'user_registrations#create'
      post 'login', to: 'user_sessions#create'
      resources :posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
