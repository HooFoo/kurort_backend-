class PointSerializer < BaseSerializer
  attributes :lat, :lng, :name, :description
  belongs_to :user
  belongs_to :lang
  has_many :attachments
  has_many :comments
  has_many :attachments
end
