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

ActiveRecord::Schema.define(version: 20160507072108) do

  create_table "event_posts", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_posts", ["event_id"], name: "index_event_posts_on_event_id"
  add_index "event_posts", ["user_id"], name: "index_event_posts_on_user_id"

  create_table "event_target_users", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_target_users", ["event_id"], name: "index_event_target_users_on_event_id"
  add_index "event_target_users", ["user_id"], name: "index_event_target_users_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "family_id"
    t.datetime "scheduled_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
  end

  add_index "events", ["family_id"], name: "index_events_on_family_id"

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_favs", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_favs", ["post_id"], name: "index_post_favs_on_post_id"
  add_index "post_favs", ["user_id"], name: "index_post_favs_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "user_id"
    t.integer  "reply_post_id"
    t.integer  "post_favs_count"
    t.string   "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "posts", ["family_id"], name: "index_posts_on_family_id"
  add_index "posts", ["reply_post_id"], name: "index_posts_on_reply_post_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.string   "name"
    t.date     "birthday"
    t.integer  "gender",           default: 0, null: false
    t.integer  "role",             default: 0, null: false
    t.string   "access_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["family_id"], name: "index_users_on_family_id"

end
