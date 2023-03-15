class Review < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  validates :raiting, presence: true
end
