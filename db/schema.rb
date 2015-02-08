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

ActiveRecord::Schema.define(version: 20150208053030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "points",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cast_votes", force: true do |t|
    t.integer "appearance_id"
    t.integer "play_id"
  end

  create_table "games", force: true do |t|
    t.string   "winner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_rounds", default: 10
  end

  create_table "holdings", force: true do |t|
    t.integer  "card_id"
    t.integer  "appearance_id"
    t.boolean  "played",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: true do |t|
    t.integer  "appearance_id"
    t.integer  "card_id"
    t.integer  "round_id"
    t.integer  "votes",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     default: "waiting for plays"
    t.boolean  "started?",   default: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
