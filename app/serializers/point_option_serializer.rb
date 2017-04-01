class PointOptionSerializer < BaseSerializer
  attributes :name, :type_name
  has_one :point_type
end
