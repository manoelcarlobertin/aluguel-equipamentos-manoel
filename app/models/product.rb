# app/models/product.rb
class Product < ApplicationRecord
  # Associations
  has_many :orders
  has_many :customers, through: :orders
end
