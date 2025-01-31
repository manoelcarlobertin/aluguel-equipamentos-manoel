class Category < ApplicationRecord
  has_many :equipaments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
