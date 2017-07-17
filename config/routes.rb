Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins, only: [:index, :create, :update] do
        resources :photos, only: [:index, :create]
      end

      resources :events, only: [:index, :create]
      resources :markers do
        resources :pins, :controller => 'markers/pins', only: [:index]
      end

    end
  end

  root 'pins#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
