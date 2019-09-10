class Event < ApplicationRecord
  mount_uploader :event_image, PhotoUploader
  geocoded_by :address
  has_many :bookings
  belongs_to :user
  after_validation :geocode, if: :will_save_change_to_address?
end
