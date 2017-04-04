class PointTypeSerializer < BaseSerializer
  attributes :name, :icon

  def icon
    asset_host+object.icon.url
  end
end
