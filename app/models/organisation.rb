class Organisation < ApplicationRecord
  has_many :missions

  validates :name, presence: true
  validates :description, presence: true
end
