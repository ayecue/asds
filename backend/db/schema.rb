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

ActiveRecord::Schema.define(version: 20131027012810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "location_ownerships", force: true do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.integer  "transaktion_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "prolonged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_ownerships", ["location_id"], :name => "index_location_ownerships_on_location_id"
  add_index "location_ownerships", ["user_id"], :name => "index_location_ownerships_on_user_id"

  create_table "location_passings", force: true do |t|
    t.datetime "entered_at"
    t.datetime "exited_at"
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "enter_point", limit: {:srid=>0, :type=>"point"}
    t.spatial  "exit_point",  limit: {:srid=>0, :type=>"point"}
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "latlong",    limit: {:srid=>0, :type=>"point"}
  end

  create_table "transaktions", force: true do |t|
    t.integer  "transaktionable_id"
    t.string   "transaktionable_type"
    t.integer  "wallet_id"
    t.float    "amount"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transaktions", ["wallet_id"], :name => "index_transaktions_on_wallet_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "color"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wallets", force: true do |t|
    t.float    "total"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wallets", ["user_id"], :name => "index_wallets_on_user_id"

end