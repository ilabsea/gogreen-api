class PinSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :icon, :user_id, :marker_id, :created_at
end
