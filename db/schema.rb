# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_12_033052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_products_on_product_id"
    t.index ["user_id"], name: "index_cart_products_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.string "receiver", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "order_id", null: false
    t.integer "price", null: false
    t.integer "quantity", null: false
    t.integer "work_status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["user_id"], name: "index_order_products_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "receiver", null: false
    t.string "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.integer "payment_option", null: false
    t.integer "status", default: 1, null: false
    t.integer "postage", default: 800, null: false
    t.integer "billing", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction"
    t.integer "price", null: false
    t.string "image"
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_products_on_area_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "account_id", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_roman", null: false
    t.string "last_name_roman", null: false
    t.date "birthday", null: false
    t.string "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.string "nickname"
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["account_id"], name: "index_users_on_account_id", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cart_products", "products"
  add_foreign_key "cart_products", "users"
  add_foreign_key "destinations", "users"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "areas"
  add_foreign_key "products", "categories"
end
