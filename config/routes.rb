Rails.application.routes.draw do
  devise_for :users
  get 'massages/index'
  root to: "massages#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
