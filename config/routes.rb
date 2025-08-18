Rails.application.routes.draw do
  root "session#new"
  resources :session, :homes

  # post "users/:user_id/follows", to: "follows#create"

  resources :users do
    resource :follows, only: [:create,:destroy]
   
  end

  resources :posts do
    member do 
      post  :like
      delete  :unlike
    end
    resources :comments
  end
end
