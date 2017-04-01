class AttachmentSerializer < BaseSerializer
  attributes :link
  has_one :comment
  has_one :point

  def link
    {
      link: object.link.url,
      thumb: object.link.thumb.url
    }
  end
end
