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

ActiveRecord::Schema.define(version: 20140306223957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: true do |t|
    t.string   "name",       null: false
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["name"], name: "index_attachments_on_name", using: :btree

  create_table "header_characters", force: true do |t|
    t.string   "nombre",                          null: false
    t.integer  "profundidad",         default: 1
    t.integer  "posicion_horizontal", default: 0
    t.integer  "posicion_vertical",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title",                      null: false
    t.text     "body",                       null: false
    t.boolean  "published",  default: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["published"], name: "index_posts_on_published", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "preferences", force: true do |t|
    t.string "name",  null: false
    t.string "value"
  end

  add_index "preferences", ["name"], name: "index_preferences_on_name", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",      null: false
    t.string   "uid",          null: false
    t.string   "provider",     null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "image"
    t.string   "location"
    t.string   "description"
    t.string   "token_access"
    t.string   "token_secret"
    t.text     "raw_info"
    t.text     "urls"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nombres"
    t.string   "email"
    t.string   "imagen"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "banned",     default: false
  end

  add_index "users", ["admin"], name: "index_users_on_admin", using: :btree
  add_index "users", ["banned"], name: "index_users_on_banned", using: :btree

end
