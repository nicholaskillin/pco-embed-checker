class Widget < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :name, :code
end
