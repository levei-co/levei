# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_03_120418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "external_id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.bigint "reverse_id", null: false
    t.string "question"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reverse_id"], name: "index_interactions_on_reverse_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "external_id"
    t.string "name"
    t.decimal "price"
    t.bigint "reverse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reverse_id"], name: "index_products_on_reverse_id"
  end

  create_table "reverses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "external_order_id"
    t.integer "status"
    t.integer "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "reason_change_to"
    t.bigint "buyer_id"
    t.index ["buyer_id"], name: "index_reverses_on_buyer_id"
    t.index ["user_id"], name: "index_reverses_on_user_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "number"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.bigint "reverse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reverse_id"], name: "index_shipping_addresses_on_reverse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "interactions", "reverses"
  add_foreign_key "products", "reverses"
  add_foreign_key "reverses", "users"
  add_foreign_key "shipping_addresses", "reverses"
end
