class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_reviews, :class_name => 'Review', :foreign_key => 'reviewer_id', dependent: :destroy
  has_many :received_reviews, :class_name => 'Review', :foreign_key => 'reviewee_id', dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :city, presence: true
  validates :profile_image, presence: true
  mount_uploader :profile_image, PhotoUploader
end
