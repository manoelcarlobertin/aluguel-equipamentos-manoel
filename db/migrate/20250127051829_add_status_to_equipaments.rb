class AddStatusToEquipaments < ActiveRecord::Migration[7.0]
  def change
    add_column :equipaments, :status, :string, default: "available"
  end
end
