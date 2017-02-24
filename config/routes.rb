Rails.application.routes.draw do
  resources :roles
  get 'rotting_zombies', to: 'rotting_zombies#index'

  resources :zombies do
    resources :tweets
    get :decomp, on: :member
  end

  root to: 'zombies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
