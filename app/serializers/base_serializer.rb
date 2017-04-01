class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :url

  def url
    helper = "#{object.class.name.underscore}_url"
    self.public_send(helper, object) if self.respond_to? helper
  end
end