class AttachmentShortSerializer < BaseSerializer
  attributes :link

  def link
    {
        link: object.link.url,
        thumb: object.link.thumb.url
    }
  end
end