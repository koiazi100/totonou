Rails.application.routes.draw do
  devise_for :users
  root to: 'hot_springs#index'
  resources :hot_springs
end
