class AddOrderToSchedules < ActiveRecord::Migration[7.2]
  def change
    add_reference :schedules, :order, null: true, foreign_key: true
  end
end
