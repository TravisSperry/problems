Rails.application.routes.draw do

  resources :project_attachments

  resources :tags

  resources :types

  resources :devise

  devise_for :users

  resources :users

  root 'pages#home'

  match '/auth/:provider/callback', :to => 'sessions#callback', :via => [:get]

  resources :projects

  mathjax 'mathjax'

end
