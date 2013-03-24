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

ActiveRecord::Schema.define(version: 20130315182248) do

  create_table "accommodations", force: true do |t|
    t.integer  "venue_id"
    t.integer  "rides_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", force: true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.text     "comments"
    t.datetime "leaving_at"
    t.datetime "returning_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: true do |t|
    t.integer  "user_id"
    t.datetime "leaving_at"
    t.datetime "return_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.text     "street"
    t.text     "city"
    t.text     "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
