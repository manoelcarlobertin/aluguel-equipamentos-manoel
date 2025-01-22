ActiveRecord::Schema[7.2].define(version: 2025_01_21_195856) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.string "email"
    t.string "mobile_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
