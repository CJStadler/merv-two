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

ActiveRecord::Schema.define(version: 20150831021148) do

  create_table "distance_units", force: true do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.integer "log_id"
  end

  add_index "distance_units", ["name"], name: "index_distance_units_on_name", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "private",                    default: true
    t.integer  "preferred_distance_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string "name"
    t.string "password_digest"
  end

  create_table "workouts", force: true do |t|
    t.date     "date"
    t.float    "distance"
    t.float    "duration"
    t.string   "title"
    t.text     "details"
    t.integer  "shoe_id"
    t.integer  "log_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "distance_unit_id"
  end

  add_index "workouts", ["date"], name: "index_workouts_on_date", using: :btree
  add_index "workouts", ["log_id", "date"], name: "index_workouts_on_log_id_and_date", using: :btree
  add_index "workouts", ["log_id"], name: "index_workouts_on_log_id", using: :btree

end
