module ApplicationHelper

  def photo_state(is_approved)
    is_approved ? 'check' : 'unchecked'
  end
end
