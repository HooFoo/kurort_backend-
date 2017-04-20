class UserSerializer < BaseSerializer
  attributes :email, :user_profile, :lang, :authentication_token
  belongs_to :lang
  has_one :user_profile
end