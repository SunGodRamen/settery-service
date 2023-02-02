class User < ApplicationRecord
  has_many :settings, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
end