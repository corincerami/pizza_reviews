Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :pizzerias do
  	resources :reviews
  end
end
