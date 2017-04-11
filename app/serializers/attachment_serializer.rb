class AttachmentSerializer < BaseSerializer
  attributes :link
  has_one :comment
  has_one :point

  def link
    {
      link: asset_host+object.link.url,
      thumb: asset_host+object.link.thumb.url
    }
  end
end
