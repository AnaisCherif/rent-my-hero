class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, :location, :price, presence: true
  validates :name, uniqueness: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def rating
    self.reviews.sum { |r| r.reco? ? 1 : -1  }
  end
end
