Rails.application.routes.draw do
  root "session#new"
  resources :session, :homes

  # post "users/:user_id/follows", to: "follows#create"

  resources :users do
    resource :follows, only: [:create,:destroy]
   
  end
  # resources :posts do
  #   resource :comments, only: [:create,:destroy]
  #   resource :likes, only: [:create,:destroy]
  # end

  resources :posts do
    resources :comments
  end

  post "like", to: "likes#create"
  delete "unlike", to: "likes#destroy"
end
