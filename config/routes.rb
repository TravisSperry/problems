Rails.application.routes.draw do

  resources :project_attachments

  resources :tags

  resources :types

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
    end

  resources :users

  root 'pages#home'

  match '/auth/:provider/callback', :to => 'sessions#callback', :via => [:get]

  resources :projects

  mathjax 'mathjax'

end
