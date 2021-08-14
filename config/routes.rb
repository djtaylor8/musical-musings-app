Rails.application.routes.draw do
  get '/home', to: 'welcome#home'
  root :to => 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions 
  resources :songs
  resources :comments
  resources :playlists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
