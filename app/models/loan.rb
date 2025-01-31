# app/models/loan.rb
class Loan < ApplicationRecord
  belongs_to :equipament
  belongs_to :user

  validates :equipament, presence: true
  validates :user, presence: true

  validate :end_date_after_start_date # Chama o método customizado

  def overdue?
    end_date.past? # Este método retorna true se a data de fim (end_date) já passou.
  end

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
