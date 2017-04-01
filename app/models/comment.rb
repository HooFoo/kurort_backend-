class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :point
  has_many :attachments, dependent: :destroy
  validates :text, length: {minimum: 3, maximum: 1024}
  validates_presence_of :user
  validates_presence_of :point

  def to_s
    text[0,20]
  end
end
