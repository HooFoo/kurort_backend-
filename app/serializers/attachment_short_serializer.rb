class AttachmentShortSerializer < BaseSerializer
  include Concerns::WithLink

  attributes :link
end