Rails.application.routes.draw do
  devise_for :users
  root to: 'hot_springs#index'
  resources :hot_springs do
    resources :comments,only: [:index, :new, :create] 
    collection do
      get 'search'
    end
  end
   resources :users, only: [:show,:edit,:update,:destroy]

   post 'like/:id' => 'likes#create', as: 'create_like'
   delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

   post 'comments_like/:id' => 'comments_likes#create', as: 'create_comments_like'
   delete 'comments_like/:id' => 'comments_likes#destroy', as: 'destroy_comments_like'
end
