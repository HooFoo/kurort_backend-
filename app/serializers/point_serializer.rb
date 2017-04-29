class PointSerializer < BaseSerializer
  attributes :lat, :lng, :name, :description, :point_type
  belongs_to :user
  belongs_to :lang
  belongs_to :point_type
  has_many :attachments
  has_many :comments
  has_many :attachments
end
