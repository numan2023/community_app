Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :learnings, only: [:index, :new, :create, :edit, :update]
  resources :jobs, only: [:index, :new, :create]
  resources :others, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
end
