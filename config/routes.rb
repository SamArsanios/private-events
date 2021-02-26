Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
  get 'users/sign_in', to: 'users#sign_in'
  put 'users/sign_in', to: 'users#logged_in'
  put 'users/sign_up', to: 'users#sign_up'
  delete 'users/log_out', to: 'users#log_out'

  resources :users
  resources :events
end
