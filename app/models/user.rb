class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  # include DeviseTokenAuth::Concerns::User
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  has_many :points
  belongs_to :lang
  has_one :user_profile

  def to_s
    email
  end
end

