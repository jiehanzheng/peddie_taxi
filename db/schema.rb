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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121230112447) do

  create_table "accommodation_changes", :force => true do |t|
    t.integer  "user_id"
    t.string   "field"
    t.text     "old_value"
    t.text     "new_value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "accommodations", :force => true do |t|
    t.integer  "user_id"
    t.datetime "departure_time"
    t.integer  "capacity"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.text     "note"
    t.text     "departure_time_slots"
    t.datetime "earliest_departure_time"
    t.datetime "latest_departure_time"
    t.integer  "stay_duration"
    t.integer  "stay_duration_margin"
    t.integer  "accommodation_id"
    t.text     "resolution"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "street"
    t.string   "city"
  end

  create_table "waitlists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "accommodation_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
