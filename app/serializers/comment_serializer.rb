class CommentSerializer < BaseSerializer
  attributes  :text, :user, :attachments
  has_one :point
  def user
    UserShortSerializer.new(object.user, scope: scope, root: false, comment: object)
  end
  def attachments
    object.attachments.map do |att|
      AttachmentShortSerializer.new(att, scope: scope, root: false, comment: object)
    end
  end
end
