RailsBlog::Application.routes.draw do
  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments
  end

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'posts#index'

end
