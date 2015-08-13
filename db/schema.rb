# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150307182939) do

  create_table "admins", force: true do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.string "email"
    t.string "role"
    t.string "salt",            limit: 40
    t.string "hashed_password", limit: 40
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issuances", force: true do |t|
    t.integer  "item_id"
    t.text     "description"
    t.decimal  "qtyissued"
    t.decimal  "qtypresent"
    t.decimal  "qtybalance"
    t.date     "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
    t.decimal  "qtysingle"
    t.decimal  "qtysingleb"
    t.date     "expiry"
    t.integer  "category_id"
  end

  create_table "items", force: true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.string   "cas_no"
    t.integer  "reorder_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit",          default: ""
  end

  create_table "receivings", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.text     "description"
    t.decimal  "qtypresent",  default: 0.0
    t.decimal  "qtyreceived", default: 0.0
    t.decimal  "qtybalance",  default: 0.0
    t.date     "expiry"
    t.date     "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "stocks", force: true do |t|
    t.integer  "item_id"
    t.date     "expiry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "qtyreceived"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   default: "new"
    t.string   "name"
  end

end
