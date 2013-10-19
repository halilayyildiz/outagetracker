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

ActiveRecord::Schema.define(version: 20131018223602) do

  create_table "affected_customers", force: true do |t|
    t.string   "inst_id"
    t.string   "outage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outage", force: true do |t|
    t.string   "outage_id"
    t.string   "description"
    t.string   "location"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "address"
    t.integer  "affected_customers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "long"
  end

  create_table "user", force: true do |t|
    t.string   "installation_id"
    t.string   "push_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
