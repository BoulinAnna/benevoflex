class User < ApplicationRecord
  has_one_attached :photo
  has_many :participations, dependent: :destroy
  has_many :missions, through: :participations

  validates :username, presence: true
  validates :competence, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
