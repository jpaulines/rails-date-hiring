class Event < ApplicationRecord
  mount_uploader :event_image, PhotoUploader
  geocoded_by :address
  has_many :bookings
  belongs_to :user
  belongs_to :event_category
  after_validation :geocode, if: :will_save_change_to_address?

  def approved_companion
    # returns a User object or nil
    approved = bookings.where(approved: true)
    if approved.count.positive?
      approved.first.user
    else
      return nil
    end
  end
end
