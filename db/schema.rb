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

ActiveRecord::Schema.define(version: 20151126111724) do

  create_table "fields", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "table_id",   limit: 4
    t.integer  "datatype",   limit: 4,   default: 0
    t.string   "items",      limit: 255
    t.boolean  "filtre",     limit: 1,   default: false
    t.boolean  "sum",        limit: 1,   default: false
  end

  add_index "fields", ["name"], name: "index_fields_on_name", using: :btree
  add_index "fields", ["table_id"], name: "index_fields_on_table_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "field_id",     limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "message",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "record_index", limit: 4
    t.string   "ip",           limit: 255
  end

  add_index "logs", ["field_id"], name: "index_logs_on_field_id", using: :btree
  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "record_index", limit: 4,   default: 0
  end

  create_table "tables_users", force: :cascade do |t|
    t.integer  "table_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tables_users", ["table_id"], name: "index_tables_users_on_table_id", using: :btree
  add_index "tables_users", ["user_id"], name: "index_tables_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "email",                limit: 255
    t.string   "password_digest",      limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "authentication_token", limit: 255
  end

  create_table "values", force: :cascade do |t|
    t.integer  "field_id",     limit: 4
    t.integer  "table_id",     limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "data",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "record_index", limit: 4
  end

  add_index "values", ["field_id"], name: "index_values_on_field_id", using: :btree
  add_index "values", ["record_index"], name: "index_values_on_record_index", using: :btree
  add_index "values", ["table_id"], name: "index_values_on_table_id", using: :btree

  add_foreign_key "logs", "fields"
  add_foreign_key "logs", "users"
  add_foreign_key "tables_users", "tables"
  add_foreign_key "tables_users", "users"
end
