class Attachment < ApplicationRecord
  belongs_to :comment
  belongs_to :point
  mount_uploader :link, AttachmentsUploader
end
