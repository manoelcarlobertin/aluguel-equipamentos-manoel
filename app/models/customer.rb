class Customer < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :mobile_phone, presence: true, format: { with: /\A\d{10,15}\z/, message: "must be between 10 to 15 digits" }

  def safe_name
    name.present? ? name.capitalize : "Nome não disponível"
  end

  def full_details
    "#{name} <#{email}>"
  end

  # Associations
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
end
