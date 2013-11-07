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

ActiveRecord::Schema.define(:version => 20131107004556) do

  create_table "bike_stations", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "status",       :null => false
    t.integer  "spaces",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "station_type"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "bike_stations", ["address"], :name => "index_bike_stations_on_address"
  add_index "bike_stations", ["name"], :name => "index_bike_stations_on_name"
  add_index "bike_stations", ["spaces"], :name => "index_bike_stations_on_spaces"

end
