class AddCategoryIdToEquipaments < ActiveRecord::Migration[7.2]
  def change
    add_column :equipaments, :category_id, :integer
  end
end
