class PointSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :name, :description, :point_type, :user
  # has_one :user
end
