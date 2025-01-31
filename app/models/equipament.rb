class Equipament < ApplicationRecord
  # Enum para o status do equipamento
  enum status: { available: 0, rented: 1, maintenance: 2 }

  # Relacionamentos
  # belongs_to :location
  belongs_to :user # Adicionado para relacionar com o User
  belongs_to :category
  belongs_to :equipament

  # has_many :rentals
  # has_many :users, through: :rentals
  # has_many :reservations
  # has_many :users, through: :reservations
  has_many :schedules
  has_rich_text :description
  has_one_attached :image

  validates :name, presence: true
  validates :serial_number, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true
  validates :image, presence: true

  # Método para verificar se o equipamento está em manutenção
  def under_maintenance?
    status == "maintenance" # Método gerado automaticamente pelo enum
  end
  # Método para verificar se o equipamento está alugado
  def rented?
    status == "rented" # Método gerado automaticamente pelo enum
  end
  # Método para verificar se o equipamento está disponível para empréstimo
  def available_for_loan?
    status == "available"
  end

  def self.availables
    left_outer_joins(:schedules)
  end

  # Método para verificar se o equipamento está alugado
  # def self.rented
  # Método para verificar se o equipamento está disponível na agenda
  # def self.available_for_schedule?
  #   Equipament.all.each do |equipament|
  #     return true if equipament.schedules.empty?
  #   end
  # end

  # criar um método para saber se o equipamento está disponível naquelas datas
  # def available_for_schedule?(start_date, end_date)
  #   schedules.each do |schedule|
  #     return false if (schedule.start_date..schedule.end_date).overlaps?(start_date..end_date)
  #   end
  #   true
  # end
end
