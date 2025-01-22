class Customer < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: true
    validates :mobile_phone, presence: true

  def full_details
    "#{name} <#{email}>"
  end
  # has_many :orders, dependent: :destroy
  # has_many :products, through: :orders
end
