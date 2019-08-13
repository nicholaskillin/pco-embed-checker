class DonationForm < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :url, presence: true

  enum app: [:giving, :people, :resources]
end
