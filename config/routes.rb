Rails.application.routes.draw do

  resources :login_events

  resources :project_attachment_types

  resources :standards do
    collection { post :import }
  end

  resources :project_attachments

  resources :tags

  resources :types

  devise_for :users, controllers: { sessions: "users/sessions" }, :skip => [:registrations]
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
