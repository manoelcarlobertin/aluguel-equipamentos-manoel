class AddImageUrlToEquipaments < ActiveRecord::Migration[7.2]
  def change
    add_column :equipaments, :image_url, :string
  end
end
