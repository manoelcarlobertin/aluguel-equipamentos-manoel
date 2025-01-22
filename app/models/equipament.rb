class Equipament < ApplicationRecord
  has_rich_text :description
  # has_one_attached :image

  validates :name, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :category, presence: true
end
