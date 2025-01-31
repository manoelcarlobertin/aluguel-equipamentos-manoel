class RemoveEquipamentLoan < ActiveRecord::Migration[7.2]
  def change
    drop_table :equipament_loans
  end
end
