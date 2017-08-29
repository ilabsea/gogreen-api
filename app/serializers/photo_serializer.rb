class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :pin_id, :status, :url, :reason, :user_id, :created_at, :updated_at, :is_rejected

  def url
    object.name.url
  end

  def is_rejected
    object.status == 'rejected'
  end
end
