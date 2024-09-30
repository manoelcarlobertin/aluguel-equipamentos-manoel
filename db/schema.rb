# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_29_172905) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", limit: 150
    t.date "dob"
    t.string "email"
    t.string "mobile_phone"
    t.string "address"
    t.string "indentification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipaments", force: :cascade do |t|
    t.string "name"
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "equipament_id", null: false
    t.date "period_start", null: false
    t.date "period_end"
    t.string "status", limit: 20, default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["equipament_id"], name: "index_orders_on_equipament_id"
    t.index ["status"], name: "index_orders_on_status"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "equipament_id", null: false
    t.string "status", default: "pending"
    t.date "period_start", null: false
    t.date "period_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["equipament_id"], name: "index_schedules_on_equipament_id"
    t.index ["order_id"], name: "index_schedules_on_order_id"
    t.index ["status"], name: "index_schedules_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", limit: 20
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "equipaments"
  add_foreign_key "schedules", "equipaments"
  add_foreign_key "schedules", "orders"
end
