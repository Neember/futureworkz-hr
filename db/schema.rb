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

ActiveRecord::Schema.define(version: 20141124091456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: true do |t|
    t.string  "kind",     default: "feedback"
    t.text    "content"
    t.integer "staff_id"
  end

  create_table "lates", force: true do |t|
    t.text     "note"
    t.integer  "staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "leaves", force: true do |t|
    t.string   "status"
    t.string   "category"
    t.text     "reason"
    t.text     "rejection_note"
    t.integer  "staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_day"
    t.datetime "end_day"
    t.string   "sub_cate"
    t.float    "total"
    t.text     "reason_note"
  end

  create_table "settings", force: true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["key"], name: "index_settings_on_key", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "english_name"
    t.string   "personal_email",                         null: false
    t.date     "birthday"
    t.text     "address"
    t.string   "phone_number"
    t.string   "basic_salary"
    t.string   "pay_increment"
    t.string   "social_insurance"
    t.string   "thirty_month_bonus"
    t.date     "started_on"
    t.date     "probation_end_on"
    t.integer  "confirmed"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false, null: false
    t.string   "designation"
    t.boolean  "is_leader",              default: false
    t.string   "leader"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
