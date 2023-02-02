class Setting < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
end