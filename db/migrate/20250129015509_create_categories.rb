class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: { unique: true } # Adicionando a restrição no banco

      t.timestamps
    end
    remove_index :categories, :name if index_exists?(:categories, :name)
    add_index :categories, 'lower(name)', unique: true # Índice único case-insensitive
  end
end
