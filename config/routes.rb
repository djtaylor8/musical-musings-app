Rails.application.routes.draw do
  get '/home', to: 'welcome#home'
  root :to => 'welcome#home'
  
  resources :songs
  resources :comments
  resources :playlists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
