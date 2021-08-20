Rails.application.routes.draw do
  get '/home', to: 'welcome#home'
  root :to => 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  get 'auth/google_oauth', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'recent-playlists', to: 'playlists#recent'
  
  resources :sessions 
  resources :songs
  resources :comments
  resources :playlists do 
    resources :comments 
  end
  resources :users do 
    resources :playlists
    resources :comments 
  end
  resources :searches 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
