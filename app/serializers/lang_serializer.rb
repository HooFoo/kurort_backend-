class LangSerializer < BaseSerializer
  attributes :name, :icon, :key

  def icon
    object.icon.url
  end
end