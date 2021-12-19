class Reservation < ApplicationRecord
  belongs_to :room
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true
  
end
