Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  
  resources :learnings, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
    end
    resource :learning_likes, only: [:create, :destroy]
  end

  resources :jobs, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
    end
    resource :job_likes, only: [:create, :destroy]
  end

  resources :others, only: [:index, :new, :create]
  resources :users, only: [:index, :edit, :update]
end
