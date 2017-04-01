class Point < ApplicationRecord
  belongs_to :user
  belongs_to :lang
  belongs_to :point_type
  has_many :comments, dependent: :destroy
  has_many :attachments, dependent: :destroy

  def to_s
    name
  end

  def self.get_rect(rect) #GET RECT 4:20 LMAO
    where("lat <= #{rect['ne']['lat']} and " +
          "lat >= #{rect['sw']['lat']} and " +
          "lng <= #{rect['ne']['lng']} and " +
          "lng >= #{rect['sw']['lng']}")
  end


end
