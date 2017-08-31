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

ActiveRecord::Schema.define(version: 20170830182006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pitch_rounds", force: :cascade do |t|
    t.integer "pitch_id"
    t.integer "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "round_number"
    t.boolean "open", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "pitch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitch_id"], name: "index_teams_on_pitch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "student_preference"
    t.bigint "team_id"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "pitch_id", null: false
    t.integer "round_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "teams", "pitches"
  add_foreign_key "users", "teams"
end
