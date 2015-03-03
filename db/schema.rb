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

ActiveRecord::Schema.define(version: 20150303033903) do

  create_table "addresses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "projectname"
    t.string   "address"
  end

  create_table "likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "listings", force: true do |t|
    t.decimal  "total_price"
    t.integer  "area_sq"
    t.string   "type_of_area"
    t.string   "floor_level"
    t.decimal  "price_per_square_foot"
    t.string   "date_of_sale"
    t.decimal  "asking_price"
    t.date     "posted_on"
    t.integer  "apartment_size"
    t.integer  "number_of_beds"
    t.integer  "number_of_bathrooms"
    t.boolean  "past"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.string   "address"
    t.string   "tenure"
    t.integer  "year_constructed"
    t.string   "picture_url"
    t.string   "street_name"
    t.string   "dwelling_type"
    t.string   "postal_district"
    t.string   "market_segment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "district_number"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
