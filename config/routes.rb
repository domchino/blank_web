Rails.application.routes.draw do
  root to: 'pages#index'

  get '/home' => 'pages#home'

  get '/about' => 'pages#about'

  get '/community' => 'pages#community'

  get '/profile' => 'pages#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end