class UserShortSerializer < BaseSerializer
  attributes :email, :username

  def username
    object.user_profile.name
  end
end
