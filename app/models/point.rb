class Point < ApplicationRecord
  belongs_to :user
  belongs_to :lang
  belongs_to :point_type
  has_many :point_options
  has_many :comments

  def to_s
    name
  end
end
