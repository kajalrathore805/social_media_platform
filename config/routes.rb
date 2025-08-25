Rails.application.routes.draw do
  root "session#new"
  resources :session, :homes

  resources :notifications,only: [:index,:create, :show]
 resources :users do
  member  do
    get 'show_user'  
    # get 'user_posts'
    end
 end

  resources :posts do
    member  do
      get 'total_likes'
    end
    resources :comments
  end

  delete "delete_notification", to: "notifications#delete_notification"

  post "like", to: "likes#create"
  delete "unlike", to: "likes#destroy"
 
  post "follow", to: "follows#create"
  delete "unfollow", to: "follows#destroy"

  # get "follow_users", to: "users#follow_users"
  # get "following", to: "users#following"
  
  get "user_follow_users", to: "follows#user_follow_users"
  get "user_following_users", to: "follows#user_following_users"
  get "user_posts", to: "posts#user_posts"
end
