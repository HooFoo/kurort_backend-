class PointSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :name, :description, :options
  has_one :user
end
