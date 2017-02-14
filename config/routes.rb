Rails.application.routes.draw do

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "dislike" => "posts#downvote"
    end
    resources :comments do
      put "like" => "comments#upvote"
      put "dislike" => "comments#downvote"
    end
  end
  resources :comments do
  end

  get '/community/posts/new' => 'posts#new'
  get '/community/posts/edit' => 'posts#edit'
  get '/community/posts/:id' => 'posts#show'
  get '/community' => 'posts#index'

  devise_for :users

  root to: 'pages#index'

  get '/home' => 'pages#home'

  get '/about' => 'pages#about'

  get '/profile' => 'pages#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
