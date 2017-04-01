class UserSerializer < BaseSerializer
  attributes :email, :user_profile, :lang, :authentication_token

  def user_profile
    UserProfileSerializer.new(object.user_profile, scope: scope, root: false, user: object)
  end

  def lang
    LangSerializer.new(object.lang, scope: scope, root: false, user: object) if object.lang
  end
end