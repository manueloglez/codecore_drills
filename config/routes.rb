Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get('/mydrills', {to: 'drillgroups#mydrills', as: 'mydrills'})
  get('/leaderboard', {to: 'users#leaderboard', as: 'leaderboard'})
  resources :drills do 
    resources :answers, only: [:create, :destroy], shallow: true
  end

  resources :drillgroups do
    resources :points, only: [:create, :destroy]
  end

  get("/", { to: "welcome#index", as: "root" })

  # for user and session resource
  resources :users
  resource :session, only: [:new, :create, :destroy]

end
