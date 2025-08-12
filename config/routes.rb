Rails.application.routes.draw do
  root "session#new"
  resources :users, :session, :homes

  resources :posts do
    resources :comments, :likes
  end
end
