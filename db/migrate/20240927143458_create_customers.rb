class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    unless ActiveRecord::Base.connection.table_exists?(:customers)
      create_table :customers do |t|
        t.string :name
        t.date :dob
        t.string :email
        t.string :mobile_phone

        t.timestamps
      end
    end
  end
end
