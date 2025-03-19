class Mission < ApplicationRecord
  belongs_to :organisation

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
end
