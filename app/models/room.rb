class Room < ApplicationRecord
  has_many :reservations
  #mount_uploader :image, ImageUploader
  has_one_attached :image

  validates :room_introduction, presence: true
  
end
