Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pins
      resources :pin_photos
      resources :events
      get 'pins/:marker_id/get_by_marker_id' => 'pins#get_by_marker_id',as: :get_by_marker_id
      get 'pins/:user_id/count_by_user' => 'pins#count_by_user',as: :count_by_user
      get 'pin_photos/:pin_id/get_by_pin_id' => 'pin_photos#get_by_pin_id',as: :get_by_pin_id
    end
  end
end
