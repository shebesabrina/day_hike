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

ActiveRecord::Schema.define(version: 20180601153553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trails", force: :cascade do |t|
    t.integer "length"
    t.string "name"
    t.string "address"
  end

  create_table "trip_trails", force: :cascade do |t|
    t.bigint "trips_id"
    t.bigint "trails_id"
    t.index ["trails_id"], name: "index_trip_trails_on_trails_id"
    t.index ["trips_id"], name: "index_trip_trails_on_trips_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_foreign_key "trip_trails", "trails", column: "trails_id"
  add_foreign_key "trip_trails", "trips", column: "trips_id"
end
