Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :categories, only: %i[index show new create]
  resources :companies, only: %i[new create]
  resources :events, only: %i[index show new create] do
    member {post :invite}
  end
  resources :games, only: %i[new create]
  resources :platforms, only: %i[index show new create]
  resources :states, only: [:show] do
    resources :cities, only: [:index]
  end
  resources :users, only: %i[edit update show] do
    member {post :invite}
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events, only: %i[index show]
      resources :games, only: %i[index destroy]
    end
  end
end
