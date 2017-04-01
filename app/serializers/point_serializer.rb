class PointSerializer < BaseSerializer
  attributes :lat, :lng, :name, :description, :user, :point_type
  has_many :attachments
  has_many :comments

  def user
    UserShortSerializer.new(object.user, scope: scope, root: false, point: object)
  end
  def point_type
    PointTypeSerializer.new(object.point_type, scope: scope, root: false, point: object)
  end
end
