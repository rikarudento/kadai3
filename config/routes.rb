Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
end