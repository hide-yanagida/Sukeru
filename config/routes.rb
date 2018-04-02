Rails.application.routes.draw do
  get '/' => 'home#top'

  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id" => "users#show"

  get "requests/index" => "requests#index"
  get "requests/new" => "requests#new"
  post "requests/create" => "requests#create"
  get "requests/:id" => "requests#show"

end
