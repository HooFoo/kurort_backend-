class PointType < ApplicationRecord
  validates :name, length: {minimum: 2, maximum: 20}, uniqueness: true
  mount_uploader :icon, IconsUploader

  def to_json
    {
        name: name,
        icon: icon
    }
  end
end
