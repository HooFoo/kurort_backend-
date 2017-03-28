class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :authentication_token
  belongs_to :lang
end