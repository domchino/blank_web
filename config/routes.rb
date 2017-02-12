Rails.application.routes.draw do
  
  resources :posts
  get '/community/posts/new' => 'posts#new'
  get '/community/posts/edit' => 'posts#edit'
  get '/community/posts/:id' => 'posts#show'

  devise_for :users

  root to: 'pages#index'

  get '/home' => 'pages#home'

  get '/about' => 'pages#about'

  get '/community' => 'pages#community'

  get '/profile' => 'pages#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
