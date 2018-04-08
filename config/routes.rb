Rails.application.routes.draw do
  get '/' => 'home#top'

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id" => "users#show"

  get "requests" => "requests#index"
  get "requests/new" => "requests#new"
  post "requests/create" => "requests#create"
  get "requests/:id/edit" => "requests#edit"
  post "requests/:id/update" => "requests#update"
  post "requests/:id/destroy" => "requests#destroy"
  get "requests/:id" => "requests#show"

  post "tasks/:request_id/create" => "tasks#create"
  post "tasks/:request_id/destroy" => "tasks#destroy"

  post "likes/:request_id/create" => "likes#create"
  post "likes/:request_id/destroy" => "likes#destroy"

end
