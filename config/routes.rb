Skate::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers, :spots
    end
  end
  resources :spots do
    member do
      get :users, :photos
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :reviews, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :votes, only: [:create, :destroy, :update]
  resources :photos

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root to: 'static_pages#home'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
end
