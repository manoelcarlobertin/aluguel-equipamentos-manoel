class AddPriceToEquipaments < ActiveRecord::Migration[7.2]
  def change
    add_column :equipaments, :price, :decimal
  end
end
