class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  # include DeviseTokenAuth::Concerns::User
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  has_many :points, dependent: :destroy
  belongs_to :lang
  has_one :user_profile, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :create_profile

  def to_s
    email
  end

  private

  def create_profile
    create_user_profile
  end
end

