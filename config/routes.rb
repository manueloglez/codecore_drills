Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get('/mydrills', {to: 'drillgroups#mydrills', as: 'mydrills'})
  get('/leaderboard', {to: 'users#leaderboard', as: 'leaderboard'})
  put('deactivate/:id(.:format)', {to:'users#deactivate', as: 'deactivate_user'})
  put('activate/:id(.:format)', {to:'users#activate', as: 'activate_user'})

  post('password/forgot', to: 'password#forgot')
  post('password/reset', to: 'password#reset')

  resources :drills do 
    resources :answers, only: [:create, :destroy], shallow: true
  end

  resources :drillgroups do
    resources :points, only: [:create, :destroy]
  end

  get("/", { to: "welcome#index", as: "root" })

  # for user and session resource
  resources :users

  
  resource :session


  
  namespace :admin do 
    resources :dashboard, only: [:index]
  end

end
