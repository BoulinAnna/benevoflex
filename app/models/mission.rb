class Mission < ApplicationRecord
  belongs_to :organisation
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
end
