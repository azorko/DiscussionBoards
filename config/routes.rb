Rails.application.routes.draw do
  root to: "subs#index"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  
  resources :posts do
    resources :comments, only: [:new, :create]
  end
end
