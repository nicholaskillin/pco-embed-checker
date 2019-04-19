class Form < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :url, presence: true, url: { schemes: ['https'] }
end
