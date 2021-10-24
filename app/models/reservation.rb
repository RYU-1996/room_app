class Reservation < ApplicationRecord
  
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :number_of_people, presence: true
  
end
