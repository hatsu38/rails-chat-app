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

ActiveRecord::Schema.define(version: 20170409161425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.integer  "room_id",    null: false
    t.integer  "user_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "room_users", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.integer  "room_id",              null: false
    t.integer  "last_read_message_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["last_read_message_id"], name: "index_room_users_on_last_read_message_id", using: :btree
    t.index ["room_id"], name: "index_room_users_on_room_id", using: :btree
    t.index ["user_id", "room_id"], name: "index_room_users_on_user_id_and_room_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_room_users_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "owner_id",     null: false
    t.integer  "room_icon_id"
    t.text     "title",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["owner_id"], name: "index_rooms_on_owner_id", using: :btree
    t.index ["room_icon_id"], name: "index_rooms_on_room_icon_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "avatar_id"
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["avatar_id"], name: "index_users_on_avatar_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
