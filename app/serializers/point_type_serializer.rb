class PointTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :icon
  has_one :point
end
