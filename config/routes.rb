Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :drills do 
    resources :answers, only: [:create, :destroy], shallow: true
  end
end
