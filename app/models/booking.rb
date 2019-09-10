class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :motivation, presence: true
end
