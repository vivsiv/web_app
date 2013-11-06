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

ActiveRecord::Schema.define(:version => 20131106230957) do

  create_table "bike_stations", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "status",       :null => false
    t.integer  "spaces",       :null => false
    t.integer  "location_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "station_type"
  end

  add_index "bike_stations", ["name"], :name => "index_bike_stations_on_name"
  add_index "bike_stations", ["spaces"], :name => "index_bike_stations_on_spaces"

  create_table "locations", :force => true do |t|
    t.string   "address",    :null => false
    t.float    "latitude",   :null => false
    t.float    "longitude",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "locations", ["address"], :name => "index_locations_on_address", :unique => true

end
