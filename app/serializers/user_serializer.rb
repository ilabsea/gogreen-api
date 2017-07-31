class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :facebook_id, :pins_count, :events_count

end
