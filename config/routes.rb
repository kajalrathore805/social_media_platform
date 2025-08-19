Rails.application.routes.draw do
  root "session#new"
  resources :session, :homes, :users

  # post "users/:user_id/follows", to: "follows#create"

  # resources  :users do
  #   resource :follows, only: [:create,:destroy]
   
  # end
 

  resources :posts do
    resources :comments
  end

  post "like", to: "likes#create"
  delete "unlike", to: "likes#destroy"

  post "follow", to: "follows#create"
  delete "unfollow", to: "follows#destroy"
end
