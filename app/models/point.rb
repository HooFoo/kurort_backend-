class Point < ApplicationRecord
  belongs_to :user
  belongs_to :lang
  has_one :point_type
  has_many :point_options

end
