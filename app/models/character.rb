class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :location, :price, :photo_url, presence: true
  validates :name, uniqueness: true
end
