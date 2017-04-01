class PointTypeSerializer < BaseSerializer
  attributes :name, :icon

  def icon
    object.icon.url
  end
end
