class PointType < ApplicationRecord
  validates :name, length: {minimum: 2, maximum: 20}, uniqueness: true
  mount_uploader :icon, IconsUploader
  has_many :point_options, dependent: :destroy
  accepts_nested_attributes_for :point_options
end
