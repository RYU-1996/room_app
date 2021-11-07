class Reservation < ApplicationRecord
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true
  validates :room_introduction, presence: true
  
end
