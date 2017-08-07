# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  pin_id     :integer
#  status     :string(50)
#  reason     :string(255)
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  self.table_name = 'photos'

  mount_base64_uploader :name, ImageUploader
  belongs_to :pin
  belongs_to :user

  STATUSES = %w(pending approved rejected)
  NUM_OF_COL = 8

  scope :approved, -> { where(status: 'approved') }
  scope :newest, -> { order('created_at DESC') }

  ## Callbacks
  before_create :set_status

  validates :pin_id, :user_id, presence: true
  validates :status, inclusion: { in: STATUSES, allow_blank: true }

  private

  def set_status
    self.status = 'pending'
  end
end
