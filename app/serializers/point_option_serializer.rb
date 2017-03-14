class PointOptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :type
  has_one :point
end
