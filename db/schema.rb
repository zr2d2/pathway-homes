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

ActiveRecord::Schema.define(version: 20140803151305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_digest_deliveries", force: true do |t|
    t.datetime "delivered_at", null: false
  end

  add_index "email_digest_deliveries", ["delivered_at"], name: "index_email_digest_deliveries_on_delivered_at", using: :btree

  create_table "notes", force: true do |t|
    t.text     "note"
    t.integer  "user_id"
    t.integer  "service_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["service_request_id"], name: "index_notes_on_service_request_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "request_types", force: true do |t|
    t.string   "category"
    t.string   "request"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_requests", force: true do |t|
    t.string   "community_name"
    t.string   "apt_number"
    t.text     "work_desc"
    t.text     "special_instructions"
    t.boolean  "alarm"
    t.string   "community_street_address"
    t.string   "community_zip_code"
    t.date     "closed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pet"
    t.boolean  "authorized_to_enter"
    t.integer  "status",                   default: 0, null: false
    t.integer  "creator_id"
    t.integer  "request_type_id"
    t.integer  "maintenance_provider"
  end

  add_index "service_requests", ["creator_id"], name: "index_service_requests_on_creator_id", using: :btree
  add_index "service_requests", ["request_type_id"], name: "index_service_requests_on_request_type_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.datetime "password_updated_at",    default: '1900-01-01 00:00:00', null: false
    t.boolean  "disabled",               default: false,                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
