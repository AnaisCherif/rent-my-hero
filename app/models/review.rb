class Review < ApplicationRecord
  belongs_to :user
  belongs_to :character

  validates :content, presence: true
  validates :reco, inclusion: {in: [true, false]}
end
