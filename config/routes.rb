Rails.application.routes.draw do
  get 'password_resets/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { to: "welcome#index", as: "root" })

  # for user and session resource
  resources :users
  
  resources :password_resets
  resources :account_activations, only: [:edit]
  resource :session, only: [:new, :create, :destroy]




end
