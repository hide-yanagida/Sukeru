Rails.application.routes.draw do
  get '/' => 'home#top'

  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "tasks/index" => "tasks#index"

  get "requests/new" => "requests#new"

end
