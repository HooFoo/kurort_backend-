class PointOption < ApplicationRecord
  Types = %w(string integer float boolean)

  belongs_to :point

  validates :name, length: {minimum: 2, maximum: 70}
  validates :type, inclusion: PointOption.Types
  validates :point, presence: true
end
