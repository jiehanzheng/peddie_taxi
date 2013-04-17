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

ActiveRecord::Schema.define(version: 20130406013228) do

  create_table "accommodations", force: true do |t|
    t.integer  "proposal_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.time     "leaving_at"
    t.time     "returning_at"
    t.integer  "capacity"
    t.integer  "day_of_week"
  end

  create_table "proposals", force: true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.integer  "week"
  end

  add_index "proposals", ["week"], name: "index_proposals_on_week"
  add_index "proposals", ["year"], name: "index_proposals_on_year"

  create_table "signups", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "school_role"
    t.string   "graduation_year"
    t.string   "site_role"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vicinity"
    t.string   "reference"
    t.integer  "user_id"
  end

end
