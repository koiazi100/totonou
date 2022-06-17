Rails.application.routes.draw do
  devise_for :users
  root to: 'hot_springs#index'
  resources :hot_springs do
    resources :comments,only: [:index, :new, :create] 
    collection do
      get 'search'
    end
  end
   resources :users, only: [:show]

   post 'like/:id' => 'likes#create', as: 'create_like'
   delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
