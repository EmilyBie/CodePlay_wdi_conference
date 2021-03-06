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

ActiveRecord::Schema.define(version: 20160522060552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_speakers", force: :cascade do |t|
    t.string   "topic"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "application_status"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "talk_time"
  end

  add_index "event_speakers", ["event_id"], name: "index_event_speakers_on_event_id", using: :btree
  add_index "event_speakers", ["user_id"], name: "index_event_speakers_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "total_seats"
  end

  create_table "seat_types", force: :cascade do |t|
    t.string   "group"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.string   "seat_num"
    t.string   "status"
    t.integer  "ticket_id"
    t.integer  "event_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "seat_type_id"
  end

  add_index "seats", ["event_id"], name: "index_seats_on_event_id", using: :btree
  add_index "seats", ["seat_type_id"], name: "index_seats_on_seat_type_id", using: :btree
  add_index "seats", ["ticket_id"], name: "index_seats_on_ticket_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "stripe_token"
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "desc"
    t.text     "img"
  end

  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  add_foreign_key "event_speakers", "events"
  add_foreign_key "event_speakers", "users"
  add_foreign_key "seats", "events"
  add_foreign_key "seats", "seat_types"
  add_foreign_key "seats", "tickets"
  add_foreign_key "users", "user_types"
end
