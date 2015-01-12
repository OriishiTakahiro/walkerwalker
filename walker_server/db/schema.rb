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

ActiveRecord::Schema.define(version: 20150110060344) do

  create_table "gpsquests", force: true do |t|
    t.integer  "flag",                  null: false
    t.integer  "lot_table",             null: false
    t.string   "destination_latitude",  null: false
    t.string   "destination_longitude", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lotrates", force: true do |t|
    t.integer  "table_id",    null: false
    t.integer  "item_id",     null: false
    t.integer  "probability", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qrevents", force: true do |t|
    t.string   "cord",       null: false
    t.integer  "reward_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "stock_step", default: 0, null: false
    t.integer  "total_step", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                    null: false
    t.string   "pass",                    null: false
    t.string   "userhash",                null: false
    t.string   "stock_item", default: "", null: false
    t.string   "step_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
