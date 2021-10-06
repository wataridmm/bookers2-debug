Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  # post 'books/edit' => 'books#edit'
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    member do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]

  end

end