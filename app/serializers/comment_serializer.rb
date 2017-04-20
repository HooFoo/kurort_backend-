class CommentSerializer < BaseSerializer
  attributes  :text, :user, :attachments
  has_one :point
  belongs_to :user
  has_many :attachments
end
