class PointSerializer < BaseSerializer
  attributes :position, :name, :description, :point_type
  belongs_to :user
  belongs_to :lang
  belongs_to :point_type
  has_many :attachments
  has_many :comments
  has_many :attachments

  def position
    { lat: object.lat, lng: object.lng }
  end
end
