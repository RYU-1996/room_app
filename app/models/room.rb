class Room < ApplicationRecord
  validates :user_id, {presence: true}
end
