class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :setting
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
end