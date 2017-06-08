Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins
      resources :pin_photos
      get 'pin_photos/:pin_id/get_by_pin_id' => 'pin_photos#get_by_pin_id',as: :get_by_pin_id
    end
  end
end
