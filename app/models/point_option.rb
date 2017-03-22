class PointOption < ApplicationRecord
  Types = %w(string integer float boolean)

  belongs_to :point_type

  validates :name, length: {minimum: 2, maximum: 70}
  validates :type_name, inclusion: PointOption::Types
end
