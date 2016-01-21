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

ActiveRecord::Schema.define(version: 20160120060258) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "access_level",        default: 0, null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"
  add_index "comments", ["user_name"], name: "index_comments_on_user_name"

  create_table "contacts", force: :cascade do |t|
    t.string   "company"
    t.string   "goes_by"
    t.string   "cell_phone"
    t.string   "sf_id"
    t.text     "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_id"
    t.string   "drivers_license"
    t.string   "spouse_goes_by"
    t.string   "date_of_birth"
    t.string   "spouse_date_of_birth"
    t.string   "alt_phone_1"
    t.string   "alt_phone_1_place"
    t.string   "alt_phone_2"
    t.string   "alt_phone_2_place"
    t.string   "alt_phone_3"
    t.string   "alt_phone_3_place"
    t.string   "alt_phone_4"
    t.string   "alt_phone_4_place"
    t.string   "company_phone"
    t.string   "home_phone"
    t.string   "spouse_cell_phone"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name_suffix"
    t.string   "spouse_first_name"
    t.string   "spouse_last_name"
    t.string   "email"
    t.string   "spouse_email"
    t.string   "alt_email"
    t.string   "alt_email_label"
    t.string   "web_address"
    t.string   "county_box1"
    t.string   "county_box2"
    t.string   "county_box3"
    t.string   "county_box4"
    t.string   "company_type"
    t.string   "ssn"
    t.string   "spouse_ssn"
    t.string   "urgent"
    t.string   "name"
    t.string   "spouse_drivers_license"
    t.string   "company2"
    t.string   "company3"
    t.string   "company_type2"
    t.string   "company_type3"
    t.text     "address_box_1"
    t.text     "address_box_2"
    t.text     "address_box_3"
    t.text     "address_box_4"
    t.string   "address_box_1_label"
    t.string   "address_box_2_label"
    t.string   "address_box_3_label"
    t.string   "address_box_4_label"
    t.string   "company_label"
    t.string   "web_address_label"
    t.string   "home_phone_label"
    t.string   "spouse_email_label"
    t.string   "email_label"
    t.string   "company_phone_label"
    t.string   "drivers_license_label"
    t.string   "cell_phone_label"
    t.string   "spouse_cell_phone_label"
    t.string   "spouse_drivers_license_label"
    t.string   "date_of_birth_label"
    t.string   "spouse_date_of_birth_label"
    t.boolean  "urg"
  end

end
