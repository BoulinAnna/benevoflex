class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :mission

  validates :mission_id, uniqueness: { scope: :user_id, message: "Cette mission est déjà réservée" }
  STATUS = ["pending", "accepted", "rejected"]
  validates :status, presence: true, inclusion: { in: STATUS }
end
