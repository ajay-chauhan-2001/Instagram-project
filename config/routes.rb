Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :posts do
    resources :comments 
    member do
      post 'like'
      delete 'unlike'

    end
  end

    resources :users
    resources :likes

    # resources :follows, only: [:create, :destroy]

  # post '/users/:id/follow', to: "users#follow", as: "follow_user"
  # post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
