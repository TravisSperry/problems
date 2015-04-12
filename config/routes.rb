Rails.application.routes.draw do

  resources :tags

  resources :types

  devise_for :users

  root 'pages#home'

  match '/auth/:provider/callback', :to => 'sessions#callback', :via => [:get]

  resources :projects

end
