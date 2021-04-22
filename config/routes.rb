Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { to: "welcome#index", as: "root" })

  # for user and session resource
  resources :users

  resource :session, only: [:new, :create, :destroy]

  resources :drillgroups

end
