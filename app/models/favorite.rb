class Favorite < ApplicationRecord
  belongs_to :mission
  belongs_to :user

  validates :mission_id, uniqueness: { scope: :user_id }
end
