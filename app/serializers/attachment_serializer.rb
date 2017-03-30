class AttachmentSerializer < ActiveModel::Serializer
  attributes :id, :link
  has_one :comment
  has_one :point
end
