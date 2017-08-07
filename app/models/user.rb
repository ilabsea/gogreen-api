# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  is_super_user   :boolean          default(FALSE)
#  facebook_id     :string(255)
#  pins_count      :integer          default(0)
#  events_count    :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  self.table_name = 'users'

  has_secure_password
  has_many :pins
  has_many :events

  validates :username, presence: true, uniqueness: true

  def self.register_with_facebook_id(facebook_id)
    user = User.find_or_initialize_by(facebook_id: facebook_id)

    if !user.persisted?
      user.username = facebook_id
      user.password = user.password_confirmation = SecureRandom.base64
      user.save
    end

    return user
  end
end
