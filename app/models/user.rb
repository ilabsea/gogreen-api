# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  is_super_user   :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  has_many :pins
  has_many :events

  validates :username, :password, :password_confirmation, :presence => true
  validates_uniqueness_of :username

  def self.register_with_facebook_id(facebook_id)
    user = User.find_or_initialize_by(facebook_id: facebook_id)
    user.username = facebook_id
    user.password = user.password_confirmation = SecureRandom.base64
    user.save

    return user
  end

end
