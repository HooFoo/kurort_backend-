class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :point
  has_many :attachments
  validates :text, length: {minimum: 3, maximum: 1024}
  validates_presence_of :user
  validates_presence_of :point

end
