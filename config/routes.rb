Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  # post 'books/edit' => 'books#edit'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books
end