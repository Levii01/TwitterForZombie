Rails.application.routes.draw do
  resources :tweets
  resources :roles
  get 'rotting_zombies', to: 'rotting_zombies#index'

  resources :zombies

  root to: 'zombies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
