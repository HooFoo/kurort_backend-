class UserSerializer < ActiveModelSerializers
  attributes :id, :email
  belongs_to :lang
end