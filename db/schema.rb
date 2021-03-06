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

ActiveRecord::Schema.define(version: 20160203154015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "retailer_suppliers", force: :cascade do |t|
    t.integer  "retailer_id"
    t.integer  "supplier_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "approval",       default: 0
    t.string   "account_number"
    t.text     "message"
  end

  create_table "stations", force: :cascade do |t|
    t.string   "brand"
    t.string   "business_name"
    t.string   "tax_id"
    t.string   "phone_number"
    t.string   "contact_person"
    t.string   "cell_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "station_reg_number"
    t.integer  "retailer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "stations", ["retailer_id"], name: "index_stations_on_retailer_id", using: :btree

  create_table "tanks", force: :cascade do |t|
    t.string   "type_of_fuel"
    t.string   "size"
    t.string   "registration_id"
    t.integer  "station_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tanks", ["station_id"], name: "index_tanks_on_station_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "tax_id"
    t.string   "business_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "years_in_business"
    t.string   "account_number"
    t.boolean  "approved"
  end

  add_index "users", ["account_number"], name: "index_users_on_account_number", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "tanks", "stations"
end
