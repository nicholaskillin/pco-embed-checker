class DonationForm < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :url, presence: true
  validates :url, length: { maximum: 255 }
end
