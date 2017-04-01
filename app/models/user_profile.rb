class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :user_profile_point_types
  has_many :point_types, through: :user_profile_point_types
end
