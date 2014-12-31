Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :pizzerias
  resources :users, only: :show
end
