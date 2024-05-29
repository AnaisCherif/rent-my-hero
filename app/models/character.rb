class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :location, :price, presence: true
  validates :name, uniqueness: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
