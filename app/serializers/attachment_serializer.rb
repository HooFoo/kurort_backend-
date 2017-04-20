class AttachmentSerializer < BaseSerializer
  include Concerns::WithLink

  attributes :link
  has_one :comment
  has_one :point
end
