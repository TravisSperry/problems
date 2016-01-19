Rails.application.routes.draw do

  # get 'errors/not_found'
  # get 'errors/internal_server_error'
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  resources :login_events

  resources :project_attachment_types

  resources :standards do
    collection { post :import }
  end

  resources :project_attachments

  resources :slider_objects

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
