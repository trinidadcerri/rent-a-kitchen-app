class Booking < ApplicationRecord
  validates :date, presence: true
  validates :date, uniqueness: {scope: :kitchen}
  belongs_to :kitchen
  belongs_to :user
  enum ["Pending", "Accepted", "Declined"]
end
