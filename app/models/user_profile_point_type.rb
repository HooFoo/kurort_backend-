class UserProfilePointType < ApplicationRecord
  belongs_to :user_profile
  belongs_to :point_type
end
