class Review < ApplicationRecord
  belongs_to :user
  belongs_to :character

  validates :content, :reco, presence: true
end
