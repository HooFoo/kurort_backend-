class Lang < ApplicationRecord
  has_many :users
  has_many :points
  validates :name, :uniqueness => true
end
