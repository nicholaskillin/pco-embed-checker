class Embed < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :data, presence: true
end
