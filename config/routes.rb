Rails.application.routes.draw do
  # Define root url
  root 'pages#index'

  # Define route for pages
  get '/home' => 'pages#home'
  get '/profile' => 'pages#profile'
  get '/explore' => 'pages#explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
