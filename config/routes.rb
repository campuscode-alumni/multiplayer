Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :categories, only: %i[index show new create]
  resources :companies, only: %i[new create]
  resources :games, only: %i[new create]
  resources :platforms, only: %i[index show new create]
  resources :events, only: [:new, :create]
end
