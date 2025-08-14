Rails.application.routes.draw do
  root "session#new"
  resources :session, :homes

  # post "users/:user_id/follows", to: "follows#create"

  resources :users do
    resources :follows, only: [:create,:destroy]
   
  end

  resources :posts do
    resources :comments, only: [:create,:destroy]
    resources  :likes, only: [:create,:destroy]
  end
end
