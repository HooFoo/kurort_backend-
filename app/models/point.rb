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
    where("lat <= ? and lat >= ? and lng <= ? and lng >= ?", rect['ne']['lat'],
                                                             rect['sw']['lat'],
                                                             rect['ne']['lng'],
                                                             rect['sw']['lng'])
  end


end
