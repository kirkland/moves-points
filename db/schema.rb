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

ActiveRecord::Schema.define(version: 20140610215542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",             null: false
    t.date     "date",             null: false
    t.integer  "distance",         null: false
    t.string   "moves_identifier", null: false
    t.integer  "user_id",          null: false
  end

  create_table "oauth_tokens", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",       null: false
    t.string   "access_token",  null: false
    t.string   "refresh_token"
    t.datetime "expires_at",    null: false
  end

  create_table "summaries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date",               null: false
    t.integer  "user_id",            null: false
    t.integer  "bicycling_distance", null: false
    t.integer  "running_distance",   null: false
    t.integer  "walking_distance",   null: false
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "moves_user_id", null: false
  end

end
