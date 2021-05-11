Rails.application.routes.draw do
  get 'massages/index'
  root to: "massages#index"
end
