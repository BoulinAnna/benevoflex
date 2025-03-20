class User < ApplicationRecord
  has_one_attached :photo
  has_many :participations, dependent: :destroy
  has_many :missions, through: :participations
  has_many :favorites, dependent: :destroy
  has_many :missions, through: :favorites
  has_many :organisations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def pending_missions
    participations.where(status: "pending").map(&:mission)
    # participations.where(status: "pending").map do |participation|
    #   participation.mission
    # end
  end

  def accepted_missions
    participations.where(status: "accepted").map(&:mission)
  end
end
