Rails.application.routes.draw do
  devise_for :users
  get 'massages/index'
  root to: "massages#index"
end
