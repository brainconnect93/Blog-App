Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#create'
      resources :users, only: [:index, :create, :show, :destroy] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
      resources :posts, only: [] do
        resources :comments, only: [:create]
      end
    end
  end

  devise_for :users
  root to: 'users#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create]
      resources :likes, only: [:create, :new]
    end
  end
end
