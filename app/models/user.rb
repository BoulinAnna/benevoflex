class User < ApplicationRecord
  has_one_attached :photo
  has_many :participations, dependent: :destroy
  has_many :missions, through: :participations
  has_many :favorites, dependent: :destroy
  has_many :missions, through: :favorites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
