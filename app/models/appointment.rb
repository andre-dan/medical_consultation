class Appointment < ApplicationRecord
  validates :starts_at, :ends_at, presence: true
  validates_time :starts_at, :ends_at, between: '9:00am'...'6:00pm'
  
  belongs_to :doctor
  belongs_to :patient
end
