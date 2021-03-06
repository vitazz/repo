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

ActiveRecord::Schema.define(version: 20160209182317) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "train_id"
    t.integer  "train_id_id"
  end

  add_index "routes", ["train_id"], name: "index_routes_on_train_id"
  add_index "routes", ["train_id_id"], name: "index_routes_on_train_id_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "number"
    t.string   "seat"
    t.integer  "train_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "start_station_id"
    t.integer  "final_station_id"
    t.string   "fio"
  end

  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vagons", force: :cascade do |t|
    t.integer  "vagon_type"
    t.integer  "top_places"
    t.integer  "bottom_places"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "train_id"
  end

end
