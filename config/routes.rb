Rails.application.routes.draw do
  root "session#new"
  resources :session, :homes

 resources :users do
  member  do
      get 'show_user'
      
    end
 end

  resources :posts do
    member  do
      get 'total_likes'
    end
    resources :comments
  end

  post "like", to: "likes#create"
  delete "unlike", to: "likes#destroy"
  

  post "follow", to: "follows#create"
  delete "unfollow", to: "follows#destroy"

 get "follow_users", to: "users#follow_users"
 get "following", to: "users#following"
end
