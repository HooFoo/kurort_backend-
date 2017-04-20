module Concerns::WithLink
  extend ActiveSupport::Concern

  def link
    {
        link: asset_host + object.link.url,
        thumb: asset_host + object.link.thumb.url
    }
  end
end