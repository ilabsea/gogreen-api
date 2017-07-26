Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins, only: [:index, :create, :update, :show] do
        resources :photos, only: [:index, :create]
      end

      resources :events, only: [:index, :create]

      resources :users, only: [:create, :show]

    end
  end
  resources :pins do
    resources :photos
  end

  root 'pins#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
