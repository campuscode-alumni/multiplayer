Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :categories, only: %i[index show new create]
  resources :companies, only: %i[new create]
  resources :games, only: %i[new create]
  resources :platforms, only: %i[index show new create]
  resources :events, only: %i[index show new create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events, only: %i[index show]
      resources :games, only: %i[index destroy]
    end
  end
end
