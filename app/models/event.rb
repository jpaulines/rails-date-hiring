class Event < ApplicationRecord
  mount_uploader :event_image, PhotoUploader
  belongs_to :user
  has_many :bookings
end
