class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :pin_id, :status, :url, :reason, :user_id, :created_at, :updated_at

  def url
    object.name.url
  end
end
