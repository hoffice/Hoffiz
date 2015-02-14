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

ActiveRecord::Schema.define(version: 20150214035925) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
  end

  add_index "bookings", ["event_id"], name: "index_bookings_on_event_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "live",                    limit: 1,     default: true
    t.boolean  "coffee",                  limit: 1
    t.boolean  "featured",                limit: 1
    t.integer  "seats",                   limit: 4
    t.string   "title",                   limit: 255
    t.text     "description",             limit: 65535
    t.string   "header_img_file_name",    limit: 255
    t.string   "header_img_content_type", limit: 255
    t.integer  "header_img_file_size",    limit: 4
    t.datetime "header_img_updated_at"
    t.string   "slug",                    limit: 255
    t.integer  "user_id",                 limit: 4
    t.string   "city",                    limit: 255
    t.string   "country",                 limit: 255
    t.string   "space_type",              limit: 255
    t.boolean  "wifi",                    limit: 1
    t.string   "near",                    limit: 255
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "spaces", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "city",        limit: 255
    t.string   "country",     limit: 255
    t.string   "space_type",  limit: 255
    t.boolean  "wifi",        limit: 1
  end

  add_index "spaces", ["user_id"], name: "index_spaces_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "users"
  add_foreign_key "spaces", "users"
end
