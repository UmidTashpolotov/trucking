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

ActiveRecord::Schema.define(version: 20170609082010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "bids", force: :cascade do |t|
    t.string   "from_city"
    t.string   "to_city"
    t.string   "weight"
    t.string   "volume"
    t.string   "phone"
    t.string   "status",     default: "new"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string   "about"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "weight"
    t.string   "volume"
    t.string   "load_type"
    t.string   "car_type"
    t.string   "imei"
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.integer  "order_id"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["from_user_id"], name: "index_comments_on_from_user_id", using: :btree
    t.index ["order_id"], name: "index_comments_on_order_id", using: :btree
    t.index ["to_user_id"], name: "index_comments_on_to_user_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.string   "status"
    t.text     "about"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "accepted",   default: false
    t.index ["order_id"], name: "index_offers_on_order_id", using: :btree
    t.index ["user_id"], name: "index_offers_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "about"
    t.string   "status",             default: "open"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "from_city"
    t.string   "to_city"
    t.string   "cargo"
    t.string   "price"
    t.integer  "weight"
    t.integer  "volume"
    t.string   "transport"
    t.date     "departure_date"
    t.string   "payment_method"
    t.string   "temperature_regime"
    t.string   "loading_type"
    t.integer  "worker_id"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
    t.index ["worker_id"], name: "index_orders_on_worker_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "role",                   default: "customer"
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "active",                 default: false
    t.string   "sms_code"
    t.boolean  "phone_checked",          default: false
    t.string   "nikita_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "cars", "users"
  add_foreign_key "comments", "orders"
  add_foreign_key "comments", "users", column: "from_user_id"
  add_foreign_key "comments", "users", column: "to_user_id"
  add_foreign_key "documents", "users"
  add_foreign_key "offers", "orders"
  add_foreign_key "offers", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "users", column: "worker_id"
end
