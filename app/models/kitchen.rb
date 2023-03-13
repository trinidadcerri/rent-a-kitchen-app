class Kitchen < ApplicationRecord
  validates :name, presence: true
  has_one_attached :photo
  has_many :bookings
end
