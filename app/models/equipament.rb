class Equipament < ApplicationRecord
  # Enum para o status do equipamento
  enum status: { available: "available", rented: "rented", maintenance: "maintenance" }

  has_many :equipament_loans
  has_many :loans, through: :equipament_loans
  has_many :schedule, through: :equipament_loans
  has_rich_text :description
  has_one_attached :image

  validates :name, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true
  validates :image, presence: true

  # Método para verificar se o equipamento está em manutenção
  def under_maintenance?
    maintenance? # Método gerado automaticamente pelo enum
  end
  # Método para verificar se o equipamento está alugado
  def rented?
    rented? # Método gerado automaticamente pelo enum
  end
  # Método para verificar se o equipamento está disponível para empréstimo
  def available_for_loan?
    available? # Método gerado automaticamente pelo enum
  end
end
