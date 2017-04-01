class UserProfileSerializer < BaseSerializer
  attributes :name, :age, :gender
  has_many :point_types
end
