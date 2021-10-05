Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  # post 'books/edit' => 'books#edit'
  resources :users do
    member do
      get :following, :followers
           end
  end

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  end

end