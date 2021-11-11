class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  #has_one_attached :image

  validates :user_id, {presence: true}
  validates :room_introduction, presence: true
  
end
