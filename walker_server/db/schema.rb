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

ActiveRecord::Schema.define(version: 20150319165621) do

  create_table "gpslogs", force: true do |t|
    t.string   "userhash",                           null: false
    t.decimal  "latitude",   precision: 9, scale: 6, null: false
    t.decimal  "longitude",  precision: 9, scale: 6, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gpsquests", force: true do |t|
    t.string   "name",                                null: false
    t.string   "description"
    t.string   "destination",                         null: false
    t.decimal  "latitude",    precision: 9, scale: 6, null: false
    t.decimal  "longitude",   precision: 9, scale: 6, null: false
    t.string   "reward",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name",            null: false
    t.integer  "effective_term",  null: false
    t.integer  "effective_value", null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qrevents", force: true do |t|
    t.string   "code",       null: false
    t.string   "reward",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qrlogs", force: true do |t|
    t.string   "userhash",   null: false
    t.string   "code",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "step_users", force: true do |t|
    t.integer  "step_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steplogs", force: true do |t|
    t.string   "userhash",   null: false
    t.integer  "step",       null: false
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
    t.string   "name",       null: false
    t.string   "pass",       null: false
    t.string   "userhash",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
