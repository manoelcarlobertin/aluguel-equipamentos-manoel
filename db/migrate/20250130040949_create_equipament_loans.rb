class CreateEquipamentLoans < ActiveRecord::Migration[7.2]
  def change
    create_table :equipament_loans do |t|
      t.references :equipament, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
