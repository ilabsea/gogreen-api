class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :facebook_link, :location, :date, :start_time, :end_time, :image, :user

  def image
    object.image.url
  end

  def user
    {facebook_id: object.user.facebook_id}
  end

end
