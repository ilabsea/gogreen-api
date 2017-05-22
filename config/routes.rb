Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins
      resources :pin_photos
    end
  end
end
