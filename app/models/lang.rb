class Lang < ApplicationRecord
  has_many :users
  has_many :points
  validates :name, :uniqueness => true

  mount_uploader :icon, SmallIconUploader
end
