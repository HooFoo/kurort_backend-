class PointOptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :type_name
  has_one :point_type
end
