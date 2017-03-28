class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  belongs_to :lang
end