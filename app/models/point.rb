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
    where('lat <= :ne_lat and lat >= :sw_lat and lng <= :ne_lng and lng >= :sw_lng', rect)
  end


end
