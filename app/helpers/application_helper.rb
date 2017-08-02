module ApplicationHelper

  def photo_state(is_approved)
    is_approved ? 'check' : 'unchecked'
  end

  def google_api_key
    ENV['GOOGLE_MAP_API_KEY']
  end
end
