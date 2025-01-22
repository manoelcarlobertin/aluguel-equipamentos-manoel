class CreateEquipaments < ActiveRecord::Migration[7.2]
  def change
    create_table :equipaments do |t|
      t.string :name
      t.string :serial_number
      t.string :category

      t.timestamps
    end
    add_index :equipaments, :serial_number, unique: true
  end
end
