Rails.application.routes.draw do
  get 'rotting_zombies', to: 'rotting_zombies#index'

  resources :zombies

  root to: 'zombies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
